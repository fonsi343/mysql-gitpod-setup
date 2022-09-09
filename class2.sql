CREATE DATABASE day2;
CREATE TABLE people (
    id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    age INT DEFAULT 18, 
    CHECK (age >= 18)
);

INSERT INTO people (first_name, last_name, age) VALUES ('Justin', 'Trudeau', 25);
INSERT INTO people (first_name, last_name, age) VALUES ('Queen', 'Elizabeth', 96);
INSERT INTO people (first_name, last_name, age) VALUES ('Joe', 'Bidden', 55);
INSERT INTO people (first_name, last_name, age) VALUES ('Kelly', 'Trudeau', 27);


CREATE TABLE Adresses (
    id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    fk_people_id INT,
    street VARCHAR(100),
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    INDEX idx_adresses_city(city),
    FOREIGN KEY (fk_people_id)
        REFERENCES people(id)
        ON DELETE CASCADE 
);

INSERT INTO Adresses (fk_people_id, city, country) VALUES (1, 'Ottawa', 'Canada');
INSERT INTO Adresses (fk_people_id, city, country) VALUES (2, 'London', 'England');
INSERT INTO Adresses (fk_people_id, city, country) VALUES (3, 'Washington', 'United States');
INSERT INTO Adresses (fk_people_id, city, country) VALUES (4, 'Ottawa', 'Canada');

SELECT * FROM people INNER JOIN Adresses ON people.id=Adresses.fk_people_id;
SELECT * FROM people, Adresses WHERE people.id=Adresses.fk_people_id;
