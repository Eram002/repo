--DELETE STATEMENT--

--Syntax--
	DELETE FROM table_name
	WHERE condition;

--Example--

CREATE TABLE OfficeEmployee
(
	ID INT IDENTITY(1,1)  PRIMARY KEY,
	Name NVARCHAR(200),
	Email NVARCHAR(200),
	Department NVARCHAR(200)

);


	SET IDENTITY_INSERT OfficeEmployee OFF;

	INSERT INTO OfficeEmployee (Name,Email,Department)
	VALUES( 'Sam','sam123@gmail.com','Development'),
		  ('ERAM','eram2k11@gmail.com','HR'),
		  ('Paul','paul58@gmail.com','IT');
 

	 SELECT * FROM OfficeEmployee;

     DELETE FROM OfficeEmployee WHERE Name = 'ERAM';

    --DELETE ALL THE RECORDS--
	
	 DELETE FROM OfficeEmployee;

    --DROP A TABLE--

    DROP TABLE OfficeEmployee;