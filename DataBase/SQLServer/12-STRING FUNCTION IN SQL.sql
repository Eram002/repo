CREATE TABLE Faculty 
(
	Faculty_ID INT NOT NULL PRIMARY KEY,
	First_Name NVARCHAR(20),
	Last_Name NVARCHAR(20),
	Dept_ID  INT NOT NULL ,
	Address NVARCHAR(20),
	City NVARCHAR(20),
	Salary INT
);

INSERT INTO Faculty( Faculty_ID,First_Name,Last_Name,Dept_ID,Address,City,Salary) 
VALUES ( 1001,'Anu','Gupta',4001,'Sangamvihar','Delhi',20000),
	   ( 1002,'Sam','Idrees',4002,'Zakirnagar','Delhi',40000),
	   (1004,'Tina','Gupta',4001,'Noida','Delhi',35000),
	   (1005,'Sara','Sia',4001,'Bandra','Mumbai',45000),
	   (1006,'Aakash','Sharma',4002,'Sector-65','Delhi',55000);

	SELECT * FROM Faculty;

SELECT City ,ASCII(City) AS ASCII_CODE_OF_COLUMN FROM Faculty;

--CHAR LENGTH STRING FUNCTION--

--SYNTAX--
	SELECT LEN(column_name)AS alias_name FROM table_name;
--EXAMPLE--
	SELECT Last_Name,   LEN(Last_Name) AS Length_of_Charater FROM Faculty;

--CONCAT STRING FUNCTION--

--SYNTAX--
	SELECT CONCAT(coulumn1,column2) AS alias_name FROM table_name;
--EXAMPLE--
	SELECT First_Name,Last_Name, CONCAT(First_Name,Last_Name) AS FullName FROM Faculty;


--UPPER STRING FUNCTION--
	SELECT UPPER(First_Name) FROM Faculty;

--LOWER STRING FUNCTION--
	SELECT LOWER(Last_Name) FROM Faculty;

--SUBSTRING FUNCTION--
	SELECT SUBSTRING(First_Name , 1,2 ), First_Name FROM Faculty;

--REPLACE FUNCTION--
	SELECT REPLACE(First_Name , 'Sam', 'Siyan'),First_Name FROM Faculty;

--USING WILDCARD  % --
	SELECT * FROM Faculty WHERE First_Name LIKE '%A';

	SELECT * FROM Faculty WHERE First_Name LIKE '%S%';

	SELECT DISTINCT * FROM Faculty WHERE City LIKE '%De%';

--USING WILDCARD _  --

	SELECT * FROM Faculty WHERE Last_Name LIKE 'Gup__';	

	SELECT * FROM Faculty WHERE City LIKE '_____';
