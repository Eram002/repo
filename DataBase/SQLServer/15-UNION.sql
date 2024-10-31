--UNION--

CREATE TABLE Vendors
(
	ID INT PRIMARY KEY,
	VendorName NVARCHAR(50),
	ContactName NVARCHAR(50),
	Address NVARCHAR(50),
	City NVARCHAR(50),
	Postalcode NVARCHAR(50),
	Country NVARCHAR(50)

);

INSERT INTO Vendors (ID,VendorName,ContactName,Address,City,Postalcode,Country)
VALUES (1,'Britania','Joseph','Newdelhi','Newdelhi',874569,'India'),
	   (2,'Nestle','Maxwell','Sector-32','Florida',321456,'USA'),
	   (3,'Aptamil','Johnmark','Newstreet','Berlin',456123,'Germany'),
	   (4,'Lipton','Ramkapur','Sector-65','Noida',123456,'UP'),
	   (5,'Nestle','Maxwell','Sector-32','Florida',321456,'USA');

SELECT * FROM Vendors;

CREATE TABLE Customer3 
(
	ConsumerID INT PRIMARY KEY,
	ConsumerName NVARCHAR(50),
	ContactName NVARCHAR(50),
	Address NVARCHAR(50),
	City NVARCHAR(50),
	Postalcode INT,
	Country NVARCHAR(50)

);

	INSERT INTO Customer3 (ConsumerID,ConsumerName,ContactName,Address,City,Postalcode,Country)
	VALUES( 1,'Tom','joseph','Street no-3','Kolkata',456123,'India'),
		  (2,'Sam','Sara','Newcolony','Kolkata',123456,'India'),
		  (3,'Hamdan','Zafar','Alqusais','Dubai',778846,'UAE'),
		  (4,'Eram','Fatma','Samastipur','Bihar',848101,'India'),
		  (5,'zoe','Panthor','Charleston', 'WS',852123,'USA');



	SELECT * FROM Customer3
	UNION
	SELECT * FROM Vendors;
--UNION ALL--
	SELECT * FROM Customer3
	UNION ALL
	SELECT * FROM Vendors;

	--UNION-- 

	SELECT VendorName FROM Vendors
	UNION 
	SELECT ConsumerName from Customer3;

	--UNION ALL--

	SELECT VendorName FROM Vendors
	UNION  ALL 
	SELECT ConsumerName from Customer3;

	SELECT City FROM Vendors
	UNION
	SELECT City FROM Customer3
	ORDER BY City;

	SELECT City FROM Vendors
	UNION ALL
	SELECT City FROM Customer3
	ORDER BY City;

	--UNION WITH WHERE CLAUSE--

	SELECT City , Country FROM Vendors
	WHERE Country = 'USA'
	UNION 
	SELECT City, Country FROM Customer3 
	WHERE Country = 'USA'
	ORDER BY City;

	--UNION ALL--
	
	SELECT City , Country FROM Vendors
	WHERE Country = 'USA'
	UNION ALL
	SELECT City, Country FROM Customer3 
	WHERE Country = 'USA'
	ORDER BY City;

--EXAMPLE-- 
	  
	  SELECT 'Customer' AS Type , ConsumerName, City, Country
	  FROM Customer3
	  SELECT 'Vendors' AS Type , ContactName,City, Country
	  FROM Vendors;
