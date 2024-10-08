CREATE TABLE Employee
(
	ID INT PRIMARY KEY,
	Name NVARCHAR(50),
	Gender NVARCHAR(50),
	City NVARCHAR(50),
	Salary INT,
);

	INSERT INTO Employee (ID,Name,Gender,City,Salary)
	VALUES (1,'Tom','Male','London',4000),
		   (2,'Pam','Female','Newyork',3000),
		   (3,'John','Male','London',3500),
		   (4,'Sam','Male','London',4500),
		   (5,'Todd','Male','Sydney',2800),
		   (6,'Ben','Male','Newyork',7000),
		   (7,'Sara','Female','Sydney',4800),
		   (8,'Vanila','Female','Newyork',5500),
		   (9,'James','Male','London',6500),
		   (10,'Russell','Female','London',8800);

	SELECT * FROM Employee;

--ADD A SALARY WITH AGGREGATE FUNCTION SUM--

	SELECT SUM(Salary) AS [Total Salary] FROM Employee;

--MIN FUNCTION--

	SELECT MIN(Salary) AS [MIN Salary] FROM Employee;

--MAX FUNCTION--

	SELECT MAX(Salary) AS [MAX Salary] FROM Employee;

--ADD A  SALARY GROUP BY CITY--

	SELECT City, SUM(Salary) AS [Total Salary] 
	FROM Employee
	GROUP BY City;

--GROUP BY  WITH MULTIPLE COLUMN--

	SELECT City, Gender ,SUM(Salary) AS [Total Salary] 
	FROM Employee
	GROUP BY City,Gender;

--ORDER BY--
	
	SELECT City,Gender, SUM(Salary)  AS [Total Salary]
	FROM Employee
	GROUP BY City,Gender
	ORDER BY City;

--TOTAL COUNT OF EMPLOYEE--

	SELECT COUNT(*)  AS [Total Count] FROM Employee;

	SELECT COUNT(ID)  AS [Total Count] FROM Employee; 	


	SELECT City,Gender, SUM(Salary) AS [Total Salary] , COUNT (ID) AS [Total Employee]
	FROM Employee
	GROUP BY City, Gender; 

--WHERE CLAUSE--

	SELECT City, Gender , SUM(Salary) AS [Total Salary] , COUNT (ID) AS [Total Employee]
	FROM Employee
	WHERE Gender = 'Male'
	GROUP BY City, Gender ;

--HAVING CLAUSE--

	SELECT City, Gender , SUM(Salary) AS [Total Salary] , COUNT (ID) AS [Total Employee]
	FROM Employee
	GROUP BY City, Gender
	HAVING Gender = 'Male';
	
--ADD A COLUMN NAME DEPARTMENTID--
	
	ALTER TABLE Employee 
	ADD  DepartmentId INT;

	UPDATE  Employee
	SET DepartmentId =1
	WHERE  ID =8;

CREATE TABLE Department 
(
	ID INT PRIMARY KEY,
	DepartmentName NVARCHAR(20),
	Location NVARCHAR(20),
	DepartmentHead NVARCHAR(20)
);


	INSERT INTO Department (ID,DepartmentName,Location,DepartmentHead)
	VALUES(1,'IT','Location','Rick'),
	(2,'Payroll','Delhi','Ron'),
	(3,'HR','Newyork','christie'),
	(4,'Other Department','Sydney','Cindrella');


	select * from Department;


	SELECT * FROM Employee;

--LEFT JOIN--

	SELECT E.Name,E.Gender,E.Salary,D.DepartmentName
	FROM Employee  E
	LEFT JOIN Department D
	ON E.DepartmentId = D.ID;

--FILTER THAT COLUMN WHERE DEPARTMENTID IS NULL--

	SELECT E.Name,E.Gender,E.Salary,D.DepartmentName
	FROM Employee E
	LEFT JOIN Department D
	ON E.DepartmentId = D.ID
	WHERE E.DepartmentId IS NULL;

--RIGHT JOIN--

	SELECT E.Name,E.Gender,E.Salary,D.DepartmentName
	FROM Employee E 
	RIGHT JOIN Department D
	ON E.DepartmentId = D.ID;
	

	SELECT E.Name,E.Gender,E.Salary,D.DepartmentName
	FROM Employee E 
	RIGHT JOIN Department D
	ON E.DepartmentId = D.ID
	WHERE E.DepartmentId IS NULL;

--FULL JOIN --
	
	SELECT E.Name,E.Gender,E.Salary,D.DepartmentName
	FROM Employee E 
	FULL JOIN Department D
	ON E.DepartmentId = D.ID;

--FILTER NON-MATCHING ROWS FROM BOTH TABLE--
	
	SELECT E.Name,E.Gender,E.Salary,D.DepartmentName
	FROM Employee E 
	FULL JOIN Department D
	ON E.DepartmentId = D.ID
	WHERE E.DepartmentId IS NULL
	OR D.ID IS NULL;