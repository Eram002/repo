 CREATE TABLE Employees
 (
	E_ID INT IDENTITY(1,1),
	E_Name NVARCHAR(50),
	E_Salary INT,
	E_Age INT,
	E_Department NVARCHAR(50),
	E_Gender NVARCHAR(50)
);
 
INSERT INTO Employees (E_Name,E_Salary,E_Age,E_Department,E_Gender)
VALUES ('Sam',50000,50,'Developer','Male'),
	   ('Tom',45000,45,'Sales','Female'),
	   ('Sofia',40000,44,'Operation','Male'), 
	   ('Hamdan',35000,40,'Design','Female'),
	   ('Eram',25000,25,'IT','Male');

	   SELECT * FROM Employees;

--CASE STATEMENT--

	SELECT E_ID,E_Salary,
	CASE 
		WHEN E_Salary > 35000 THEN ' Salary is greater than 35000'
		WHEN E_Salary > 45000 THEN 'Salary is greater than 45000'
		ELSE 'Salary is equal to 25000'
	END AS TotalSalary
	FROM Employees;

--EXAMPLE--
	SELECT E_ID,E_Salary,
	CASE 
		WHEN E_Salary > 45000 THEN ' Salary is greater than 45000'
		WHEN E_Salary > 35001 THEN 'Salary is greater than 35001'
		ELSE  'low'
	END 
	FROM Employees;
--CASE WITH MULTIPLE CONDITION--

	SELECT E_Name,E_Age,
	CASE 
		WHEN E_Gender = 'Male' THEN 'MaleEmployee'
		WHEN E_Gender = 'Female' THEN 'FemaleEmployee'

	ELSE 'UNKNOWN'
	END AS 'NEWEMPLOYEE'
	FROM Employees;

-- USE >, < --
	
	SELECT E_Name,E_Department,E_Age,
	CASE 
		WHEN E_Age >25 THEN 'Age is greater than 25'
		WHEN E_Age <45 THEN 'Age is less than 45'
		
	ELSE 'THE AGE IS UNDER 50'
	END 
	FROM Employees;



--CASE WITH >= , <= --

	SELECT E_Name ,E_Department ,E_Age,
	CASE 
		WHEN E_Age >= 50 THEN 'Age is GREATER THAN 25'
		WHEN E_Age <= 45 THEN 'Age is LESS  THAN 45'

	ELSE NULL
	END
	FROM Employees;


	SELECT E_Name,
	CASE
		WHEN E_Age > 45 THEN 'Age is GREATER THAN 45'
	ELSE 'MINOR'
	END AS TYPE
	FROM Employees;