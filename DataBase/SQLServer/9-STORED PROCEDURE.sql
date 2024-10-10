--STORED PROCEDURE--

--SYNTAX--

	CREATE PROCEDURE procedure_name
	AS
	BEGIN
	SELECT column1,column2...FROM table_name
	END 

--Example--

	select * from Employee;

	CREATE PROCEDURE spGetEmployees
	AS
	BEGIN
		SELECT Name,Gender FROM Employee
	END

--EXECUTE STORED PROCEDURE--

	spGetEmployees

	EXEC spGetEmployees

--STORED PROCEDURE WITH PARAMETERS--

	CREATE PROCEDURE spGetEmployeesByGenderAndDepartmentId
	@Gender NVARCHAR(20),
	@DepartmentId INT
	AS
	BEGIN
		SELECT Name,Gender,DepartmentId FROM Employee WHERE Gender= @Gender
		AND DepartmentId = @DepartmentId
	END

	EXEC spGetEmployeesByGenderAndDepartmentId 'Male',1 

	EXEC spGetEmployeesByGenderAndDepartmentId 'Male',2

	EXEC spGetEmployeesByGenderAndDepartmentId 'Female',3	

	EXEC spGetEmployeesByGenderAndDepartmentId  @DepartmentId =1, @Gender ='Male'

--VIEW THE STORED PROCEDURE--

	sp_helptext spGetEmployeesByGenderAndDepartmentId

	 CREATE PROCEDURE spGetEmployeesByGenderAndDepartmentId  
	 @Gender NVARCHAR(20),  
	 @DepartmentId INT  
	 AS  
	 BEGIN  
	  SELECT Name,Gender,DepartmentId FROM Employee WHERE Gender= @Gender  
	  AND DepartmentId = @DepartmentId  
	 END

--ALTER  WITH ORDER BY STORED PROCEDURE--

	ALTER PROCEDURE  spGetEmployees
	AS
	BEGIN
	SELECT Name,Gender FROM Employee ORDER BY Name
	END

	EXEC  spGetEmployees

--DROP A STORED PROCEDURE--

	DROP PROCEDURE spGetEmployees

--ENCRYPT STORED PROCEDURE--

	ALTER PROCEDURE spGetEmployees
	WITH ENCRYPTION
	AS 
	BEGIN
	SELECT Name,Gender FROM Employee ORDER BY Name
	END

	sp_helptext spGetEmployees

