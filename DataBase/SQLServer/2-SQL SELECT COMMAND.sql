--SELECT ALL THE COLUMNS--
	1. CREATE A TABLE.


	CREATE TABLE Student 
	(
	ID INT Identity(1,1) NOT NULL,
	Name  NVARCHAR(200) NOT NULL,
	Age INT NOT NULL,
	Address NVARCHAR(200) NOT NULL
	PRIMARY KEY (ID)
	);


	Syntax

	SELECT  * from table_name;

	Example 

	SELECT * FROM Student;

	INSERT INTO Student (Name,Age,Address) VALUES
	('John',23,'Noida'),
	('Tina',21,'Gurgaon'),
	('Sofia',24,'Jammu'),
	('Sam',21,'Goa'),
	('Tom',19,'Kerala');

	SELECT Name, Address FROM Student;
	
	--Find the DISTINCT Rows--
	SELECT DISTINCT Age FROM Student;

	--HOW TO USE WHERE CLAUSE--
	 Syntax 

	 SELECT Column1, Column2
	 FROM table_name
	 WHERE Conditions;

	 Example


	 SELECT ID , Name 
	 FROM Student
	 WHERE ID = 4 AND Name= 'Sam';

	--ORDER BY CLAUSE--
	 
	 Syntax

	 SELECT Column1, Column2
	 FROM table_name
	 ORDER BY Column1,Column2;
	
	Example

	SELECT * FROM Student
	ORDER BY Age;

	SELECT ID,Age
	FROM Student
	ORDER BY ID,Age;

--ORDER BY WITH ASC--
	SELECT Name ,Address
	FROM Student
	ORDER BY Name ASC;


--ORDER BY WITH DESC--
	SELECT ID,Name 
	FROM Student
	ORDER BY ID DESC;

--ORDER BY CLAUSE WITH MULTIPLE COLUMNS--
	SELECT ID, Name,Address
	FROM Student
	ORDER BY Name,Address DESC;
