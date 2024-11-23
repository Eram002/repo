	SELECT * FROM Employee_Details;

--FIND THE 2ND HIGHEST SALARY--

	SELECT MAX (Emp_Salary) AS Secondhighestsalary
	FROM Employee_Details 
	WHERE Emp_Salary NOT IN (SELECT MAX(Emp_Salary) FROM Employee_Details);


--FIND THE 2ND MINIMUM SALARY--

	SELECT MIN (Emp_Salary) AS Secondminimumsalary
	FROM Employee_Details 
	WHERE Emp_Salary NOT IN (SELECT MIN (Emp_Salary) FROM Employee_Details);