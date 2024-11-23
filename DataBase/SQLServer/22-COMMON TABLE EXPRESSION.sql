select * from Department;

SELECT * FROM Employee;

WITH EmployeeCount (DepartmentId, TotalEmployees)
AS
(
	SELECT DepartmentId, COUNT(*)AS TotalEmployees
	FROM Employee
	GROUP BY DepartmentId

)


	SELECT DepartmentName, DepartmentHead
	FROM Department
	JOIN Employee 
	ON Department.DeptId = Employee.DepartmentId
	ORDER BY DepartmentName;

--CREATING MULTIPLE CTE's USING A SINGLE WITH CLAUSE--

	WITH EmployeesCountby_Payroll_IT_Dept (DepartmentName, Total)
	AS
	(
		SELECT Name, COUNT(*) AS TotalEmployees
		FROM Employee
		JOIN Department
		ON Employee.DepartmentId = Department.DeptId
		WHERE DepartmentName IN ('Payroll','IT')
		GROUP BY Name
	),

	EmployeesCountbyHR_Other_Department (DepartmentName, Total)
	AS
	(
		SELECT Name, COUNT(*) AS TotalEmployees
		FROM Employee
		JOIN Department
		ON Employee.DepartmentId = Department.DeptId
		WHERE DepartmentName IN ('HR','Other Department')
		GROUP BY Name
	)  

	SELECT * FROM  EmployeesCountbyHR_Other_Department
	UNION
	SELECT * FROM  EmployeesCountby_Payroll_IT_Dept

--CREATE A CTE--

	WITH Employee_Name_Gender  AS
	( 
		SELECT ID,Name,Gender 
		FROM Employee
	)

	SELECT * FROM  Employee_Name_Gender;

--UPDATE A CTE--

	WITH Employee_Name_Gender AS
	(
		SELECT ID,Name,Gender  FROM Employee
	)

	UPDATE Employee_Name_Gender 
	SET Gender ='Female'
	WHERE ID =1;

	SELECT * FROM Employee;

--CTE ON 2 BASE TABLE, UPDATE AFFECTS ON ONLY 1 BASE TABLE--

	WITH EmployeesbyDepartment AS 
	(
		SELECT e.ID, e.Name,e.Gender,d.DepartmentName
		FROM Employee e
		JOIN  Department d
		ON d.DeptId = e.DepartmentId
	)
	UPDATE EmployeesbyDepartment SET Gender ='Male'  WHERE  Name ='Tom';

	SELECT * FROM Employee;

--FIND THE AVERAGE SALARY BY 'WITH' CLAUSE--

	WITH average_salary  (avg_sal) AS 
			(SELECT AVG(Salary) FROM Employee)

	SELECT * FROM 
	Employee e , average_salary av
	WHERE e.Salary > av.avg_sal;

	SELECT * FROM Cars;

--FIND THE TOTAL COST--
	
	SELECT C.Car_Color, SUM(Car_Cost) as total_cost
	FROM Cars c
	GROUP BY C.Car_Color;

--FIND THE AVERAGE COST--

	SELECT AVG(avg_cost) AS avg_cost
	FROM (SELECT C.Car_Color, SUM(Car_Cost) as avg_cost
	FROM Cars c
	GROUP BY C.Car_Color)  X;

--SUBQUERY--

	SELECT * 
	FROM	 (SELECT C.Car_Color, SUM(Car_Cost) as total_cost
			 FROM Cars c
			 GROUP BY C.Car_Color)  total_sales
	JOIN	( SELECT AVG(avg_cost) AS avg_cost
			 FROM (SELECT C.Car_Color, SUM(Car_Cost) as avg_cost
			 FROM Cars c
			 GROUP BY C.Car_Color) X) avg_sales

	ON		 total_sales.total_cost > avg_sales.avg_cost;

--WITH CLAUSE--

	WITH total_cost ( Car_Color,total_cost) AS
			
				(SELECT C.Car_Color, SUM(Car_Cost) as total_cost
				FROM Cars c
				GROUP BY C.Car_Color),

		avg_sales (avg_cost) AS
				(SELECT AVG(total_cost) AS avg_cost FROM total_cost )
	
		SELECT  *
		FROM total_cost  tc
		JOIN avg_sales  av
		ON   tc.total_cost > av.avg_cost;


		select * from Employees;

--CTE--

		WITH  Employees_cte AS 
		(
			SELECT E_ID,E_Name,E_Salary
			FROM Employees 
			WHERE E_Department = 'Sales'
		)
		SELECT * FROM Employees_cte;

--CTE WITH AGGRGATE FUNCTION--

	WITH Employees_cte AS
	(
		SELECT E_ID ,SUM(E_Salary) AS Total_Salary
		FROM Employees
		GROUP BY E_ID
	)
		SELECT E.E_ID,E.Total_Salary
		FROM  Employees_cte E
		WHERE E.Total_Salary > 35000;

