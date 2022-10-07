CREATE DATABASE IF NOT EXISTS toy_sales;
USE toy_sales;


CREATE TABLE IF NOT EXISTS Employees (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL  
);

CREATE TABLE IF NOT EXISTS  Toys (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    toy_name VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    price FLOAT

);

CREATE TABLE  IF NOT EXISTS Sales (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    toy_id INT NOT NULL,
    employee_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity FLOAT NOT NULL,
    CHECK (quantity > 0),
    FOREIGN KEY (toy_id)
         REFERENCES Toys(id)
         ON DELETE CASCADE,
    FOREIGN KEY (employee_id)
         REFERENCES Employees(id)
         ON DELETE CASCADE       
);


INSERT INTO Employees (employee_name) VALUES ('Rob Stevens');
INSERT INTO Employees (employee_name) VALUES ('Jane White');
INSERT INTO Employees (employee_name) VALUES ('Sofia Clark');

INSERT INTO Toys (toy_name, brand, price) VALUES ('Bumblebee', 'Transformers', 14.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Optimus Prime', 'Transformers', 19.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Lightning McQueen', 'Disney Cars', 23.97);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Ramone', 'Disney Cars', 20.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Wonder Woman', 'Barbie', 39.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Princess Leia', 'Barbie', 99.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Wizard of Oz: Glinda', 'Barbie', 43.95);

INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (5, 3, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (1, 1, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (3, 1, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (6, 3, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (2, 3, '2020-07-03', 1);

