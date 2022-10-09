CREATE DATABASE airline;
SHOW DATABASES;
USE airline;

--LOCATIONS TABLE

CREATE TABLE Locations (
  Airport_ID VARCHAR(10),
Country_ID VARCHAR(10),
  Country_Name VARCHAR(15),
  State_ID VARCHAR(10),
  State_Name VARCHAR(15),
  City_ID VARCHAR(10),
  City_Name VARCHAR(15),
  PRIMARY KEY (Airport_ID)
);

INSERT INTO Locations(Airport_ID, Country_ID, Country_Name, State_ID, State_Name, City_ID, City_Name) VALUES("1", "CAD", "CANADA", "ON", "ONTARIO", "1", "TORONTO");
INSERT INTO Locations(Airport_ID, Country_ID, Country_Name, State_ID, State_Name, City_ID, City_Name) VALUES("2", "CAD", "CANADA", "QB", "QUEBEC", "2", "MONTREAL");
INSERT INTO Locations(Airport_ID, Country_ID, Country_Name, State_ID, State_Name, City_ID, City_Name) VALUES("3", "USA", "UNITED STATES", "NY", "NEW YORK", "1", "NEW YORK");
INSERT INTO Locations(Airport_ID, Country_ID, Country_Name, State_ID, State_Name, City_ID, City_Name) VALUES("4", "USA", "UNITED STATES", "ILL", "ILLINOIS", "2", "CHICAGO");

ALTER TABLE Locations RENAME COLUMN Airport_ID TO PK_Airport_ID;

-- SHOW CREATE TABLE Locations;

--Airline table
CREATE TABLE Airline (
  PK_Airline_ID VARCHAR(10),
  Airline_Name VARCHAR(20),
  Airline_Nationality VARCHAR(15),
  PRIMARY KEY (PK_Airline_ID) );

  INSERT  INTO Airline ( PK_Airline_ID, Airline_Name, Airline_Nationality) VALUES("AirCan", "AIR CANADA", "CANADA");
  INSERT  INTO Airline ( PK_Airline_ID, Airline_Name, Airline_Nationality) VALUES("USAir", "US AIRWAYS", "UNITED STATES");
  INSERT  INTO Airline ( PK_Airline_ID, Airline_Name, Airline_Nationality) VALUES("BritAir", "BRITISH AIRWAYS", "UNITED KINGDOM");
  INSERT  INTO Airline ( PK_Airline_ID, Airline_Name, Airline_Nationality) VALUES("AirFra", "AIR FRANCE", "FRANCE");

-- FLIGHT TABLE
--NOTE: First, Business and Economy class seats fields on the Flight table refer to the number of seats that have already been purchased within each category

CREATE TABLE Flight (
  PK_Flight_Number VARCHAR(10),
  Departure_Airport VARCHAR(15),
  Arrival_Airport VARCHAR(15),
  Airline_ID VARCHAR(10),
  Airplane_Type VARCHAR(10),
  Flight_Status VARCHAR(10),
  Tail_Number VARCHAR(10),
  Departure_Date DATE,
  Arrival_Date DATE,
  First_Class_Seats INT(2),
  Business_Class_Seats INT(2),
  Economy_Class_Seats INT(2),
  PRIMARY KEY (Flight_Number),
  FOREIGN KEY (Departure_Airport) REFERENCES Locations(PK_Airport_ID),
  FOREIGN KEY (Airline_ID) REFERENCES Airline(PK_Airline_ID));

ALTER TABLE Flight RENAME COLUMN Flight_Number TO PK_Flight_Number
PRIMARY KEY (PK_Flight_Number);

INSERT INTO Flight(PK_Flight_Number) VALUES("001");

UPDATE Flight
SET Departure_Airport="1", Arrival_Airport="3"
WHERE PK_Flight_Number="001";

UPDATE Flight
SET Airline_ID="AirCan", Airplane_Type="Jumbo", Flight_Status="OnSchedule", Tail_Number="J1", First_Class_Seats=10, Business_Class_Seats=20, Economy_Class_Seats=100
WHERE PK_Flight_Number="001";

INSERT INTO Flight(PK_Flight_Number, Departure_Airport, Arrival_Airport, Airline_ID, Airplane_Type, Flight_Status, Tail_Number, First_Class_Seats, Business_Class_Seats, Economy_Class_Seats)
VALUES("002", "2", "4", "USAir", "Airbus", "OnSchedule", "A1", 8, 16, 80);
INSERT INTO Flight(PK_Flight_Number, Departure_Airport, Arrival_Airport, Airline_ID, Airplane_Type, Flight_Status, Tail_Number, First_Class_Seats, Business_Class_Seats, Economy_Class_Seats)
VALUES("003", "2", "3", "USAir", "Airbus", "OnSchedule", "A2", 8, 16, 80);
INSERT INTO Flight(PK_Flight_Number, Departure_Airport, Arrival_Airport, Airline_ID, Airplane_Type, Flight_Status, Tail_Number, First_Class_Seats, Business_Class_Seats, Economy_Class_Seats)
VALUES("004", "1", "4", "AirCan", "Airbus", "OnSchedule", "A3", 8, 16, 80);

ALTER TABLE Flight RENAME COLUMN Departure_Airport TO FK_Departure_Airport;
ALTER TABLE Flight RENAME COLUMN Arrival_Airport TO FK_Arrival_Airport;

-- MAILING ADRESS TABLE

CREATE TABLE Mailing_Address (
  PK_Mailing_Address VARCHAR(30),
  Mailing_Country VARCHAR(15),
  Mailing_City VARCHAR(15),
  Postal_Code VARCHAR(10),
  Mailing_Region VARCHAR(15),
  Street VARCHAR(15),
  Mailing_Phone VARCHAR(10),
  PRIMARY KEY (PK_Mailing_Address));

INSERT INTO Mailing_Address(PK_Mailing_Address, Mailing_Country, Mailing_City, Postal_Code, Mailing_Region, Street, Mailing_Phone) VALUES("Arbour Crest Heights", "CANADA", "CALGARY","T3G111", "ALBERTA", "123", "3134565285");
INSERT INTO Mailing_Address(PK_Mailing_Address, Mailing_Country, Mailing_City, Postal_Code, Mailing_Region, Street, Mailing_Phone) VALUES("Bicknell", "CANADA", "TORONTO","T3T222", "ONTARIO", "42", "313444444");
INSERT INTO Mailing_Address(PK_Mailing_Address, Mailing_Country, Mailing_City, Postal_Code, Mailing_Region, Street, Mailing_Phone) VALUES("1210 N Waller Ave", "UNITES STATES", "CHICAGO","U3G333", "ILLINOIS", "34", "113888888");
INSERT INTO Mailing_Address(PK_Mailing_Address, Mailing_Country, Mailing_City, Postal_Code, Mailing_Region, Street, Mailing_Phone) VALUES("82 Haslemere Ave", "UNITED KINGDOM", "LONDON","L3G555", "GREATER LONDON", "5", "2132222222");

--Customer mail table

CREATE TABLE Mail_Customers (
  PK_Mail_Customers_ID VARCHAR(12),
  Customer_ID VARCHAR(12),
  Mailing_Address VARCHAR(30),
  PRIMARY KEY (PK_Mail_Customers_ID),
  FOREIGN KEY (Mailing_Address) REFERENCES Mailing_Address(PK_Mailing_Address));
 
INSERT INTO Mail_Customers(PK_Mail_Customers_ID, Customer_ID, Mailing_Address) VALUES("1111", "0001","Arbour Crest Heights");
INSERT INTO Mail_Customers(PK_Mail_Customers_ID, Customer_ID, Mailing_Address) VALUES("2222", "0002","Bicknell");
INSERT INTO Mail_Customers(PK_Mail_Customers_ID, Customer_ID, Mailing_Address) VALUES("3333", "0003","1210 N Waller Ave");
INSERT INTO Mail_Customers(PK_Mail_Customers_ID, Customer_ID, Mailing_Address) VALUES("4444", "0004","82 Haslemere Ave");

--Customer table

CREATE TABLE Customer (
  PK_Customer_ID VARCHAR(12),
  Mailing_Address VARCHAR(30),
  First_Name VARCHAR(15),
  Last_Name VARCHAR(15),
  Citizenship VARCHAR(15),
  Passport_Number VARCHAR(15),
  Phone_Number VARCHAR(10),
  Email VARCHAR(30),
  PRIMARY KEY (PK_Customer_ID));

  INSERT INTO Customer(PK_Customer_ID, Mailing_Address, First_Name, Last_Name, Citizenship, Passport_Number, Phone_Number, Email)
  VALUES ("1111", "Arbour Crest Heights", "ALFONSO", "REYES", "COLOMBIA", "AQ8123", "31312345", "alfonso@gmail.com");

  INSERT INTO Customer(PK_Customer_ID, Mailing_Address, First_Name, Last_Name, Citizenship, Passport_Number, Phone_Number, Email)
  VALUES ("2222", "Bicknell", "MARIA", "SHULDZ", "USA", "AU7354", "14551575", "maria@gmail.com");

  INSERT INTO Customer(PK_Customer_ID, Mailing_Address, First_Name, Last_Name, Citizenship, Passport_Number, Phone_Number, Email)
  VALUES ("3333", "1210 N Waller Ave", "SAMANTHA", "KISHNA", "UK", "AK8777", "31346266", "samantha@gmail.com");

  INSERT INTO Customer(PK_Customer_ID, Mailing_Address, First_Name, Last_Name, Citizenship, Passport_Number, Phone_Number, Email)
  VALUES ("4444", "82 Haslemere Ave", "RYOU", "URARAKI", "JAPAN", "AJ9090", "51312995", "ryou@gmail.com");

--Change data type 

ALTER TABLE Flight
MODIFY Departure_Date DATETIME;

ALTER TABLE Flight
MODIFY Arrival_Date DATETIME;

--UPDATE Flight information

UPDATE Flight
SET Arrival_Date="2022-10-06 21:00"
WHERE PK_Flight_Number = "001";

UPDATE Flight
SET Arrival_Date="2022-11-06 20:00"
WHERE PK_Flight_Number = "002";

UPDATE Flight
SET Arrival_Date="2022-12-01 1:00"
WHERE PK_Flight_Number = "003";

UPDATE Flight
SET Arrival_Date="2022-12-15 16:00"
WHERE PK_Flight_Number = "004";

UPDATE Flight
SET Departure_Date="2022-10-06 19:00"
WHERE PK_Flight_Number= "001";

UPDATE Flight
SET Departure_Date="2022-11-06 12:00"
WHERE PK_Flight_Number= "002";

UPDATE Flight
SET Departure_Date="2022-11-30 17:00"
WHERE PK_Flight_Number= "003";

UPDATE Flight
SET Departure_Date="2022-12-15 12:30"
WHERE PK_Flight_Number= "004";


--Transaction Table

CREATE TABLE Transaction_Table (
  PK_Transaction_Number VARCHAR(10),
  Total_Price FLOAT(10,2),
  Flight_Price FLOAT(10,2),
  Airport_Tax_Origin FLOAT(10,2),
  Airport_Tax_Destination FLOAT(10,2),
  Amount_Paid FLOAT(10,2),
  Outstanding_Balance FLOAT(10,2),
  Currency VARCHAR(10),
  Exchange_Rate_US_Dollar FLOAT(10,2),
  Payment_Date DATETIME,
  Remaining_Days_Payment INT(2),
  PRIMARY KEY (PK_Transaction_Number));

  INSERT INTO Transaction_Table ( PK_Transaction_Number, Total_Price, Flight_Price, Airport_Tax_Origin, Airport_Tax_Destination, Amount_Paid, Outstanding_Balance, Currency, Exchange_Rate_US_Dollar, Payment_Date, Remaining_Days_Payment)
  VALUES ("12345678", 500.00, 400.00, 50.00, 50.00, 500.00, 0, "US DOLLAR", 1.00, "2022-10-06 18:00", 15);

  INSERT INTO Transaction_Table ( PK_Transaction_Number, Total_Price, Flight_Price, Airport_Tax_Origin, Airport_Tax_Destination, Amount_Paid, Outstanding_Balance, Currency, Exchange_Rate_US_Dollar, Payment_Date, Remaining_Days_Payment)
  VALUES ("98765432", 900.00, 800.00, 50.00, 50.00, 900.00, 0, "CAD DOLLAR", 2.30, "2022-11-01 15:00", 10);

  INSERT INTO Transaction_Table ( PK_Transaction_Number, Total_Price, Flight_Price, Airport_Tax_Origin, Airport_Tax_Destination, Amount_Paid, Outstanding_Balance, Currency, Exchange_Rate_US_Dollar, Payment_Date, Remaining_Days_Payment)
  VALUES ("222222", 800.00, 600.00, 100.00, 100.00, 800.00, 0, "US DOLLAR", 1.00, "2022-10-08 19:00", 20);

  INSERT INTO Transaction_Table ( PK_Transaction_Number, Total_Price, Flight_Price, Airport_Tax_Origin, Airport_Tax_Destination, Amount_Paid, Outstanding_Balance, Currency, Exchange_Rate_US_Dollar, Payment_Date, Remaining_Days_Payment)
  VALUES ("111111", 700.00, 600.00, 40.00, 60.00, 700.00, 0, "CAD DOLLAR", 2.80, "2022-10-09 20:00", 15);

--Booking Table
CREATE TABLE Booking (
  PK_Booking_Number VARCHAR(10),
  Flight_Number VARCHAR(10),
  Transaction_Number VARCHAR(10),
  Customer_ID VARCHAR(12),
  Booking_Status VARCHAR(10),
  Booking_Office VARCHAR(10),
  Booking_Date DATETIME,
  Booked_First_Class INT(2),
  Booked_Business_Class INT(2),
  Booked_Economy_Class INT(2),
  PRIMARY KEY (PK_Booking_Number),
  FOREIGN KEY (Flight_Number) REFERENCES Flight(PK_Flight_Number),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(PK_Customer_ID),
  FOREIGN KEY (Transaction_Number) REFERENCES Transaction_Table(PK_Transaction_Number));

INSERT INTO Booking(PK_Booking_Number, Flight_Number, Transaction_Number, Customer_ID, Booking_Status, Booking_Office, Booking_Date, Booked_First_Class, Booked_Business_Class, Booked_Economy_Class)
VALUES ("121212", "001","12345678", "1111", "BOOKED","TORONTO", "2022-09-20 10:00", 1, 0, 0); 

INSERT INTO Booking(PK_Booking_Number, Flight_Number, Transaction_Number, Customer_ID, Booking_Status, Booking_Office, Booking_Date, Booked_First_Class, Booked_Business_Class, Booked_Economy_Class)
VALUES ("898989", "002","98765432", "2222", "BOOKED","NEW YORK", "2022-08-10 11:00", 0, 1, 0); 

INSERT INTO Booking(PK_Booking_Number, Flight_Number, Transaction_Number, Customer_ID, Booking_Status, Booking_Office, Booking_Date, Booked_First_Class, Booked_Business_Class, Booked_Economy_Class)
VALUES ("323232", "003","222222", "3333", "BOOKED","LONDON", "2022-10-1 1:00", 0, 0, 1); 

INSERT INTO Booking(PK_Booking_Number, Flight_Number, Transaction_Number, Customer_ID, Booking_Status, Booking_Office, Booking_Date, Booked_First_Class, Booked_Business_Class, Booked_Economy_Class)
VALUES ("454545", "004","111111", "4444", "BOOKED","BERLIN", "2022-09-1 8:00", 1, 0, 0); 

--QUERIES
SELECT a.PK_Booking_Number, b.PK_Customer_ID
FROM Booking a, Customer b
where Customer_ID=PK_Customer_ID


--1)BOARDING TICKET 
SELECT PK_Flight_Number, Departure_Date, Arrival_Date, Airline_Name, (SELECT city_name FROM Locations AS l WHERE f.FK_Arrival_Airport=l.PK_Airport_ID) As "Arrival City", (SELECT city_name FROM Locations AS l WHERE f.FK_Departure_Airport=l.PK_Airport_ID) As "Departure City", Customer_ID, First_Name, Last_Name
FROM Flight as f
INNER JOIN Airline as a
ON f.Airline_ID=a.PK_Airline_ID
INNER JOIN Booking as b
ON f.PK_Flight_Number=b.Flight_Number
INNER JOIN
Customer AS c
ON c.PK_Customer_ID=b.Customer_ID;

  
--2)HOW MANY PEOPLE THERE ARE PER CLASS ON A PARTICULAR FLIGHT
SELECT PK_Flight_Number, Tail_Number, First_Class_Seats, Business_Class_Seats, Economy_Class_Seats
FROM Flight;

--NOTE: Class seats number refer to already purchased seats on each respective class

--3)CUSTOMER WANTS TO UPGRADE SEAT FROM ECONOMY TO FIRST CLASS
UPDATE Booking as b
INNER JOIN Customer as c ON b.Customer_ID=c.PK_Customer_ID
SET Booked_Economy_Class="0", Booked_First_Class="1"
WHERE Last_Name="KISHNA";


--4)BOOK A FLIGHT FOR A NEW CUSTOMER

INSERT INTO Mailing_Address(PK_Mailing_Address, Mailing_Country, Mailing_City, Postal_Code, Mailing_Region, Street, Mailing_Phone)
VALUES("258 Blackthorn Ave", "CANADA", "TORONTO", "456230", "ONTARIO", "1", "11177777");
INSERT INTO Mail_Customers(PK_Mail_Customers_ID, Customer_ID, Mailing_Address)
VALUES("5555", "5555","258 Blackthorn Ave");
INSERT INTO Customer(PK_Customer_ID, Mailing_Address, First_Name, Last_Name, Citizenship, Passport_Number, Phone_Number, Email)
VALUES("5555", "258 Blackthorn Ave", "Biandi", "Santos", "COLOMBIA", "A8934", "131159315", "biandi@gmail.com");
INSERT INTO Transaction_Table(PK_Transaction_Number, Total_Price, Flight_Price, Airport_Tax_Origin, Airport_Tax_Destination, Amount_Paid, Outstanding_Balance, Currency, Exchange_Rate_US_Dollar, Payment_Date, Remaining_Days_Payment)
VALUES("888888", 600.00, 500.00, 50.00, 50.00, 600.00, 0, "US DOLLAR", 1.00, "2022-10-1 13:00", "10");
INSERT INTO Booking(PK_Booking_Number, Flight_Number, Transaction_Number, Customer_ID, Booking_Status, Booking_Office, Booking_Date, Booked_First_Class, Booked_Business_Class, Booked_Economy_Class)
VALUES("100000", "001","888888", "5555", "BOOKED", "TORONTO", "2022-10-1 13:00", 1, 0, 0);


--5)ADD A SECOND PHONE NUMBER

ALTER TABLE Customer
ADD COLUMN Phone_Number_2 VARCHAR(10) AFTER Phone_Number; 

UPDATE Customer
SET Phone_Number_2="31354321"
WHERE PK_Customer_ID="1111";

--6)NAMES OF PEOPLE ARRIVING AT AN AIRPORT AT A CITY ON A PARTICULAR DAY 

First_Name, Last_Name, Arrival_Date, Airport_ID, City_Name, Flight_Number

SELECT Arrival_Date, PK_Flight_Number, (SELECT city_name FROM Locations AS l WHERE f.FK_Arrival_Airport=l.PK_Airport_ID) as "Arrival City", Customer_ID, First_Name, Last_Name
FROM Flight as f
INNER JOIN Booking as b 
ON f.PK_Flight_Number=b.Flight_Number
INNER JOIN Customer as c 
ON b.Customer_ID=c.PK_Customer_ID
WHERE Arrival_Date like "%2022-10-06%";

--7)UPDATE ALL FLIGHTS FOR A GIVEN CITY TO BE DELAYED AT A GIVEN TIME

UPDATE Flight as f
INNER JOIN Locations as l ON f.FK_Departure_Airport=l.PK_Airport_ID
SET Flight_Status = "OnSchedule"
WHERE l.City_Name="TORONTO";


--8)REMOVE A FLIGHT THAT HAS BOOKED PASSENGERS
--NOTE: Customers will be notified of a refund on their booking status and the flight will change status to cancelled

Flight_Status="Cancelled"
Booking_Status ="Refund Available due to Cancelation"

UPDATE Flight
SET Flight_Status="Cancelled"
WHERE PK_Flight_Number="001";
UPDATE Booking
SET Booking_Status="Refund"
WHERE Flight_Number="001";

--NOTE: TO NOT REWRITE AGAIN INFORMATION OF FLIGHT NUMER 001,  DUMMY FLIGHT 005 WILL BE REMOVED
INSERT INTO Flight(PK_Flight_Number) VALUES("005");
DELETE FROM Flight
WHERE PK_Flight_Number="005";

