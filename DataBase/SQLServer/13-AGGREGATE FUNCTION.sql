	SELECT * FROM Employee_Details;

--COUNT THE NO.OF EMPLOYEE--
	SELECT COUNT(*) AS TotalEmployee FROM Employee_Details;

--SUM AGGREGATE FUNCTION --
	SELECT SUM(Emp_Salary)AS TotalSalary FROM Employee_Details;

	SELECT SUM(Emp_Salary) FROM Employee_Details
	WHERE Employee_Id = 105;

--AVG SALARY OF EMPLOYEE--
	SELECT AVG(Emp_Salary)AS AvgSalary FROM Employee_Details;

--MAX--
	SELECT  MAX(Emp_Salary) FROM Employee_Details;

--MIN--
	SELECT MIN(Emp_Salary) AS MINIMUMSALARY FROM Employee_Details;

--MIN FUNCTION WITH GROUP BY CLAUSE--
	SELECT MIN(Emp_Salary) ,Emp_Penalty FROM Employee_Details
	GROUP BY Emp_Penalty;

	SELECT COUNT(Employee_Id),Emp_City 
	FROM Employee_Details 
	GROUP BY Emp_City;

	SELECT Employee_Id , SUM(Emp_Salary) AS TotalSalary 
	FROM Employee_Details
	GROUP BY Employee_Id;

--MIN FUNCTION WITH WHERE CLAUSE--
	SELECT MIN(Emp_Salary) FROM Employee_Details 
	WHERE Emp_Name LIKE 'V%';

	SELECT COUNT(Emp_Penalty) FROM Employee_Details 
	WHERE  Emp_Salary < 40000;

	SELECT COUNT(Employee_Id), Emp_City 
	FROM Employee_Details 
	GROUP BY Emp_City
	ORDER BY Emp_City DESC;

	SELECT COUNT(DISTINCT Emp_Penalty) 
	FROM Employee_Details;

--MIN FUNCTION WITH HAVING CLAUSE--

	SELECT  MIN(Emp_Salary) AS MINSalary 
	FROM  Employee_Details 
	HAVING MIN (Emp_Salary)  < 40000;
