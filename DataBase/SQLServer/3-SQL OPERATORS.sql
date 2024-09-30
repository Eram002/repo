--SQL OPERATORS--

--CREATE A TABLE 

	CREATE TABLE Employees
	(
	 EmployeeID INT IDENTITY(101,1), 
	 FirstName NVarchar(200) NOT NULL,
	 LastName NVarchar(200) NOT NULL,
	 Age INT, 
	 Salary INT,
	 Department NVarchar(200)
	
		PRIMARY KEY(EmployeeID)
	);

	INSERT INTO Employees (FirstName,LastName,Age,Salary,Department) VALUES
	 ('John','Shon',30,6000,'IT'),
	 ('Sam','Smith',25,5000,'HR'),
	 ('Sara','George',40,7500,'Finance'),
	 ('Lisa','Abram',28,4800,'IT'),
	 ('Tom','Brown',35,7000,'Finance');


	SELECT * FROM Employees;

--AND OPERATOR--
	--Example
--select the Employee from finance department AND salary >5000.
	
	SELECT * FROM Employees
	WHERE Department ='Finance'
	AND Salary > 5000;

--OR OPERATOR--
--select the Employee who work in HR OR Salary is more than 5000.

	SELECT * FROM Employees
	WHERE Department = 'HR'
	OR Salary >5000;
--NOT OPERATOR--
--select the Employee who doesn't work in IT Department.

	SELECT * FROM Employees 
	WHERE NOT Department = 'IT';
	
--IN OPERATOR--
	
	SELECT * FROM Employees
	WHERE  Salary IN (4500,6000,7000,7500);

--BETWEEN OPERATOR--
	
	SELECT * FROM Employees
	WHERE Age  BETWEEN 25 AND 40;

--LIKE OPERATOR--

	SELECT * FROM Employees
	WHERE FirstName LIKE 'S%';

