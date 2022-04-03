DROP DATABASE IF EXISTS TravelOnTheGo;
CREATE DATABASE TravelOnTheGo;
USE TravelOnTheGo;

# 1
CREATE TABLE PASSENGER(
	PASS_ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Passenger_name varchar(255),
    Category varchar(10),
    Gender char(1),
    Boarding_City varchar(50),
    Destination_City varchar(50),
    Distance int,
    Bus_Type varchar(50)
);

CREATE TABLE PRICE(
	ID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Bus_Type varchar(50),
    Distance int,
    Price decimal
);

INSERT INTO PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type)
	VALUES ("Sejal", "AC", "F", "Bengaluru", "Chennai", 350, "Sleeper"),
		   ("Anmol", "Non-AC", "M", "Mumbai", "Hyderabad", 700, "Sitting"),
           ("Pallavi", "AC", "F", "Panaji", "Bengaluru", 600, "Sleeper"),
           ("Khusboo", "AC", "F", "Chennai", "Mumbai", 1500, "Sleeper"),
           ("Udit", "Non-AC", "M", "Trivandrum", "Panaji", 1000, "Sleeper"),
           ("Ankur", "AC", "M", "Nagpur", "Hyderabad", 500, "Sitting"),
           ("Hemant", "Non-AC", "M", "Panaji", "Mumbai", 700, "Sleeper"),
           ("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting"),
           ("Piyush", "AC", "M", "Pune", "Nagpur", 700, "Sitting");

INSERT INTO PRICE(Bus_Type, Distance, Price)
	VALUES ("Sleeper", 350, 770),
		   ("Sleeper", 500, 1100),
           ("Sleeper", 600, 1320),
           ("Sleeper", 700, 1540),
           ("Sleeper", 1000, 2200),
           ("Sleeper", 1200, 2640),
           ("Sleeper", 1500, 2700),
           ("Sitting", 500, 620),
           ("Sitting", 600, 744),
           ("Sitting", 700, 868),
           ("Sitting", 1000, 1240),
           ("Sitting", 1200, 1488),
           ("Sitting", 1500, 1860);
    

# 3
SELECT Gender, COUNT(PASS_ID) as PASS_COUNT FROM PASSENGER WHERE Distance >= 600 GROUP BY Gender;

# 4
SELECT Min(Price) FROM PRICE WHERE Bus_Type = "Sleeper";

# 5
SELECT Passenger_name FROM PASSENGER WHERE Passenger_name LIKE 'S%';

# 6
SELECT Passenger_name, Boarding_City, Destination_City, PASSENGER.Bus_Type, Price FROM PASSENGER JOIN PRICE ON PASSENGER.Distance = PRICE.Distance AND PASSENGER.Bus_Type = PRICE.Bus_Type;

# 7
SELECT Passenger_name, Price FROM PASSENGER JOIN PRICE ON PASSENGER.Distance = PRICE.Distance AND PASSENGER.Bus_Type = PRICE.Bus_Type WHERE PASSENGER.Distance = 1000 AND PASSENGER.Bus_Type = "Sitting";

# 8
SELECT Passenger_name, PRICE.Bus_Type , Price FROM PASSENGER JOIN PRICE ON PASSENGER.Distance = PRICE.Distance WHERE (PASSENGER.Boarding_City = "Bengaluru" AND PASSENGER.Destination_City = "Panaji") OR (PASSENGER.Boarding_City = "Panaji" AND PASSENGER.Destination_City = "Bengaluru");

# 9
SELECT Distance FROM PASSENGER GROUP BY Distance ORDER BY Distance DESC;

# 10
SELECT P.Passenger_name, ((P.Distance/SUM(PA.Distance))*100) AS PERC_TRAVEL FROM PASSENGER AS P CROSS JOIN PASSENGER AS PA GROUP BY P.PASS_ID;

# 11
SELECT Distance, Price, CASE WHEN Price > 1000 THEN 'Expensive' WHEN Price > 500 THEN 'Average Cost' ELSE 'Cheap' END AS CATEGORY_BY_PRICE FROM PRICE;
