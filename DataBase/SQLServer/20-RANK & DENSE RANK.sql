	SELECT * FROM Employee_Details;

--FIND THE 2ND HIGHEST SALARY--

	SELECT MAX (Emp_Salary) AS Secondhighestsalary
	FROM Employee_Details 
	WHERE Emp_Salary NOT IN (SELECT MAX(Emp_Salary) FROM Employee_Details);

								OR
	SELECT * FROM Employee_Details ORDER BY Emp_Salary DESC;

	SELECT MAX(Emp_Salary) AS [2nd Highest Salary] FROM Employee_Details
	WHERE Emp_Salary < (SELECT MAX(Emp_Salary) FROM Employee_Details);


	SELECT DISTINCT TOP 2 Emp_Salary 
	FROM Employee_Details 
	ORDER BY Emp_Salary DESC;

--FIND THE 2ND MINIMUM SALARY--

	SELECT MIN (Emp_Salary) AS Secondminimumsalary
	FROM Employee_Details 
	WHERE Emp_Salary NOT IN (SELECT MIN (Emp_Salary) FROM Employee_Details);

--FIND THE 2ND HIGHEST SALARY--

	SELECT TOP 1 Emp_Salary  FROM 
	(SELECT DISTINCT TOP 2 Emp_Salary FROM Employee_Details 
	ORDER BY Emp_Salary DESC )
	Result 
	ORDER BY Emp_Salary ASC;

--FIND THE 3RD HIGHEST SALARY --

	SELECT TOP 1 Emp_Salary FROM 
	(SELECT DISTINCT TOP 3 Emp_Salary FROM Employee_Details
	ORDER BY Emp_Salary DESC)
	Result
	ORDER BY Emp_Salary ASC;

					OR 
					
	SELECT MIN(Emp_Salary) AS [3RD Highest Salary] FROM Employee_Details 
	WHERE Emp_Salary IN (SELECT TOP 3 Emp_Salary FROM Employee_Details ORDER BY Emp_Salary DESC);

	SELECT TOP 3  Emp_Salary 
	FROM Employee_Details;

--DENSE RANK ( ) --

	SELECT Emp_Salary , DENSE_RANK() OVER (ORDER BY Emp_Salary DESC ) AS DENSERANK 
	FROM Employee_Details;

	SELECT * FROM Employee_Details 
	WHERE Emp_Salary = (SELECT MAX(Emp_Salary) FROM Employee_Details);

	SELECT DISTINCT (Emp_Salary) FROM Employee_Details  E1
	WHERE 3-1 = (SELECT COUNT(DISTINCT(E2.Emp_Salary)) FROM Employee_Details E2 
	WHERE E2.Emp_Salary > E1.Emp_Salary);

	UPDATE  Employee_Details
	SET Emp_Salary = 40000
	WHERE Employee_Id = 107;


	SELECT * FROM (
	SELECT Emp_Name ,Emp_Salary , DENSE_RANK ()
	OVER (ORDER BY Emp_Salary DESC) AS SALARY_RANK 
	FROM Employee_Details )
	AS TempRank
	WHERE Salary_Rank = 2;


	SELECT Employee_Id,Emp_Salary,
	RANK() OVER (ORDER BY Emp_Salary DESC) AS rank
	FROM Employee_Details;


	SELECT Employee_Id,Emp_Salary,
	DENSE_RANK() OVER (ORDER BY Emp_Salary DESC) AS denserank
	FROM Employee_Details;

	-- ROW_NUMBER( ) --

	 SELECT ROW_NUMBER() OVER 
	 (ORDER BY Emp_Penalty ASC) AS ROWNUM,
	 Employee_Id,Emp_Name
	 FROM Employee_Details;

	SELECT Employee_Id, ROW_NUMBER ( ) OVER 
	(ORDER BY Emp_Penalty DESC) AS ROWNUM,
	RANK () OVER (ORDER BY Emp_Penalty) AS RANK,
	DENSE_RANK ( ) OVER (ORDER BY Emp_Penalty) AS DENSERANK,
	PERCENT_RANK ( ) OVER (ORDER BY Emp_Penalty) AS PERCENTRANK
	FROM Employee_Details;

	SELECT Employee_Id,
	FIRST_VALUE(Employee_Id) OVER (ORDER BY Employee_Id) AS FIRSTVALUE,
	LAST_VALUE (Employee_Id) OVER (ORDER BY Employee_Id) AS LASTVALUE,
	LEAD (Employee_Id) OVER (ORDER BY Employee_Id) AS LEAD,
	LAG (Employee_Id) OVER (ORDER BY Employee_Id) AS LAG
	FROM Employee_Details;

	SELECT Employee_Id,
	LEAD (Employee_Id,2) OVER (ORDER BY Employee_Id) AS LEAD_BY2,
	LAG (Employee_Id,2) OVER (ORDER BY Employee_Id) AS LAG_BY2
	FROM Employee_Details;

--CASE STATEMENT--

	SELECT Employee_Id,Emp_Salary,
	CASE
		WHEN Emp_Salary > 40000 THEN 'Highersalary'
		WHEN Emp_Salary > 35000 THEN 'Averagesalary'
		WHEN Emp_Salary = 22000 THEN 'Lowersalary'

		ELSE 'Lesssalary'

	END AS Salary_status
	FROM Employee_Details;

--CASE EXPRESSION--

	SELECT Employee_Id,
	CASE Emp_Salary 
		WHEN 40000 THEN 'Highersalary'
		WHEN 22000 THEN 'Lowersalary'
		ELSE  'AvgSalary'
	END AS Salarystatus
	FROM Employee_Details;