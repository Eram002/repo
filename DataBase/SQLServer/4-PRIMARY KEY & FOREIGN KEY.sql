--CREATE TABLE AND MAKING CONNECTION WITH PRIMARY AND FOREIGN KEY--

CREATE TABLE Person
(
	ID INT PRIMARY KEY,
	Name NVARCHAR(200),
	Email NVARCHAR(200),
	GenderID INT NULL
);

INSERT INTO Person (ID, Name,Email,GenderID) VALUES
 (1,'Jade','jade123@gmail.com',2),
 (2,'Mary','mary43@gmail.com',3),
 (3,'Martin','mar@m.com',1),
 (4,'Rob','rob32@gmail.com',NULL),
 (5,'Mary','mary123@gmail.com',2),
 (6,'Kristin','kristin@gmail.com',NULL);

 SELECT * FROM Person;
 SELECT * FROM Gender;


CREATE TABLE Gender 
(
	
	ID INT  PRIMARY KEY,
	Gender NVARCHAR(50)

);

INSERT INTO Gender (ID, Gender ) VALUES 
 (1,'Male'),
 (2,'Female'),
 (3,'Unknown');


--MARK A GenderID AS Foreign key--

ALTER TABLE Person ADD CONSTRAINT
Person_Gender_FK
Foreign key (GenderID) references Gender (ID);


--CREATE FOREIGN KEY CONSTRAINT--

--Example--


CREATE TABLE Customer
(
	ID INT PRIMARY KEY,
	CustomerName NVARCHAR(50) NOT NULL
);

INSERT INTO Customer (ID,CustomerName)
VALUES (1,'John'),(2,'jane'),(3,'BOb');


CREATE TABLE Orders 
(
		OrderId INT PRIMARY KEY,
		Ordernumber INT NOT NULL,
		ID INT NOT NULL,
		FOREIGN KEY (ID) References Customer(ID)

);

INSERT INTO Orders (OrderId,Ordernumber,ID)
VALUES (1,101,1),(2,102,2),(3,103,3);

SELECT * FROM Customer;

SELECT * FROM Orders;

--ADD A FOREIGN KEY--
ALTER TABLE Customer 
ADD CONSTRAINT Customer_Orders_FK 
FOREIGN KEY (ID) References Customer(ID);


--DROP A FOREIGN KEY  CONSTRAINT--

 ALTER TABLE Customer 
 DROP CONSTRAINT Customer_Orders_FK;

--CREATE A TABLE WITH UNIQUE CONSTRAINT--

CREATE TABLE Persons
(
	ID INT NOT NULL,
	FirstName NVARCHAR(50),
	LastName  NVARCHAR(50),
	Age		  INT,
	CONSTRAINT  UC_Person UNIQUE (ID,LastName)
);

 INSERT INTO Persons (ID,FirstName,LastName,Age) 
 VALUES (201,'Sam','Smith',29),
	   (202,'Alan','Will',30),
	   (203,'Ronaldo','Sam',28);

SELECT * FROM Persons;

--ADD UNIQUE CONSTRAINT--
 ALTER TABLE Persons
 ADD CONSTRAINT UC_Persons UNIQUE(ID,LastName);

--DROP UNIQUE CIONSTRAINT--

 ALTER TABLE Persons
 DROP CONSTRAINT UC_Persons;
 
-- CREATE A TABLE WITH A  CHECK CONSTRAINT--


CREATE TABLE Staff
(
	ID INT PRIMARY KEY NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Department NVARCHAR(50),
	City NVARCHAR(50),
	Age INT,
	Salary INT CHECK (Salary>=10000)
);

INSERT INTO Staff (ID,Name,Department,City,Age,Salary)
VALUES   (1001,'Emma','IT','Delhi',29,25000),
		 (1002,'George','IT','Delhi',27,25000),
		 (1003,'Cristine','HR','Mumbai',31,10000),
		 (1004,'Seby','TechnicalSupport','Hyderabad',32,12000),
		 (1005,'Khalid','Sales','Delhi',25,17000);

SELECT * FROM Staff;

--ADD A CHECK CONSTRAINT--

ALTER TABLE Staff
ADD CONSTRAINT CK_Staff CHECK (Age >22 AND Age < 40);

--ALTER TABLE Staff
--ADD CONSTRAINT CK_Staff CHECK (Age =27 AND Salary >= 10000);

--DROP A CHECK CONSTRAINT--

ALTER TABLE Staff
DROP CONSTRAINT  CK_Staff;


--CREATE A TABLE WITH DEFAULT CONSTRAINT--

CREATE TABLE Emp2
(
	ID       INT NOT NULL,
	Name     NVARCHAR(50),
	Age	     INT,
	Location NVARCHAR(50) DEFAULT 'Delhi'
);

INSERT INTO Emp2 (ID,Name,Age,Location) VALUES
				 (1,'Mona',27,DEFAULT),
				 (2,'Sonam',23,DEFAULT),
				 (3,'Sam',29,DEFAULT),
				 (4,'John',21,DEFAULT);

SELECT * FROM Emp2;

--ADD A DEFAULT CONSTRAINT--

--SYNTAX--
	ALTER TABLE table_name
	ADD CONSTRAINT constraint_name
	DEFAULT default_value FOR Existing_column_Name
--Example--
	ALTER TABLE Emp2
	ADD CONSTRAINT DF_Emp2_Age
	DEFAULT 25 FOR Age;


--DROP A DEFAULT CONSTRAINT--

--Syntax--
	ALTER TABLE table_name
	DROP CONSTRAINT constraint_name
	

--Example-- 
ALTER TABLE Emp2
DROP CONSTRAINT DF_Emp2_Age;

ALTER TABLE Emp2
DROP CONSTRAINT DF_Emp2_Location;
