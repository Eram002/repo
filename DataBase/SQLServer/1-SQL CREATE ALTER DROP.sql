1.CREATE DATABASE?
	
	Syntax
	CREATE DATABASE databasename;

	Example
	CREATE DATABASE Sample

2. Find the Syntax and Example for CREATE, ALTER AND DROP COMMAND?
	Syntax
	CREATE 

	CREATE TABLE table_name
	(
	Column_name1 Datatype Constraints,
	Column_name2 Datatype constraints,
	);

	Example

	CREATE TABLE Customer
	(
	Customer_Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50),
	Email VARCHAR(50),
	Phone INT,
	Address VARCHAR(50)
	); 
	SET IDENTITY_INSERT Customer OFF
	INSERT INTO Customer (Name,Email,Phone,Address) VALUES
	('Sam','s@ss.com',7799184,'5thstreetDubai'),
	('Tom','t@tt.com',54736875,'alqusaisdubai'),
	('Sara','s@ss.com',88775566,'Delhi');
	

	Syntax
	UPDATE

	UPDATE  table_name
	SET Column_Name = NEW Column_Name
	WHERE Condition;

	Example

	UPDATE  Customer 
	SET Address = 'Gurgaon'
	WHERE Customer_Id = 5;

	SELECT * FROM Customer;


	--ADD A COLUMN IN EXISTING TABLE--
	Syntax

	ALTER TABLE table_name
	ADD  Column_name datatype;

	Example

	ALTER TABLE Customer
	ADD State VARCHAR(50);

	SELECT * FROM Customer;

-- DROP COLUMN FROM EXISTING TABLE--
	Syntax

	ALTER TABLE table_name
	DROP COLUMN Column_name;

	Example

	ALTER TABLE Customer
	DROP COLUMN State;

