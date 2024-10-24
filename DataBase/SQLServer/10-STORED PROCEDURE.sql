CREATE TABLE Consumer
(
	ConsumerId INT IDENTITY(1,1) PRIMARY KEY,
	ConsumerName NVARCHAR(50),
	ContactName VARCHAR(50),
	Country VARCHAR(50)
);

	INSERT INTO Consumer (ConsumerName,ContactName,Country) 
	VALUES ('Aman','Disha','India'),
	('Shiv','Raj','India'),
	('Sam','Smith','UK'),
	('John','Paul','Australia'),
	('Sara','faan','USA');

	SELECT * FROM Consumer;

	CREATE PROCEDURE spGetConsumerByCountryAndContactName
	@Country NVARCHAR(50)
	AS
	BEGIN
		SELECT ConsumerId,ConsumerName
		FROM Consumer 
		WHERE Country = @Country
	END;

	EXEC spGetConsumerByCountryAndContactName  @Country = 'India';

	EXEC spGetConsumerByCountryAndContactName  @Country = 'UK';

--STORED PROCEDURE WITH MULTIPLE PARAMETERS--

	CREATE PROCEDURE selectallconsumer  @ConsumerName NVARCHAR(30),
	@Country NVARCHAR(30)
	AS
	BEGIN
	SELECT * FROM 
	Consumer 
	WHERE ConsumerName = @ConsumerName
	AND Country = @Country
	END

	EXEC selectallconsumer @ConsumerName = 'Sam', @Country = 'UK';

	EXEC selectallconsumer  @ConsumerName = 'Sara', @Country = 'USA';

--STORED PROCEDURE WITH OUTPUT PARAMETER--
	SELECT * FROM Employee;

	CREATE PROCEDURE spGetEmployeeCountByGender
	@Gender NVARCHAR(20),
	@EmployeeCount INT OUTPUT 
	AS
	BEGIN 
		SELECT @EmployeeCount  = COUNT (ID) FROM Employee
		WHERE Gender = @Gender
	END

	Declare @TotalCount INT 
	EXEC spGetEmployeeCountByGender 'Male' , @TotalCount OUTPUT 
	Print @TotalCount

--view the text of the stored procedure--
	sp_helptext spGetEmployeeCountByGender
	
