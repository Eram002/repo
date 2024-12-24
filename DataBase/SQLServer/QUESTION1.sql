--WRITE A QUERY TO RETRIEVE A DUPLICATE SALARY RECORDS FROM THE EMPLOYEES TABLE--

	CREATE TABLE Employees 
	(
		Emp_ID INT IDENTITY(101,1) PRIMARY KEY , 
		Emp_Name NVARCHAR(50),
		Emp_Department NVARCHAR(50),
		Emp_Gender NVARCHAR(50),
		Emp_Salary DECIMAL(10,2),
		Email NVARCHAR(50),
		Contact_No INT 
	);

	INSERT INTO Employees (Emp_Name,Emp_Department,Emp_Gender,Emp_Salary,Email,Contact_No)
	VALUES ('Samiya','IT','Female',75000.00,'samiya@gmail.com',779918926),
		   ('Zafar','Developer','Male',70000.50,'zafarmicro@gmail.com',99674821),
		   ('Eram','IT','Female',75000.00,'eram2k11@gmail.com',958714598),
		   ('Hamdan','DigitalMarketing','Male',95000,'hamdan@gmail.com',778855442),
		   ('sam','HR','Male',65000,'sam112@gmail.com',665541232),
		   ('John','Finance','Male',75000.00,'john65@gmail.com',958752492),
		   ('Hassan','IT','Male',90000,'Hassan@gmail.com',939637158);

		SELECT* FROM Employees;

		SELECT Emp_Salary, COUNT(Emp_Salary) AS Totalsalarycount
		FROM Employees
		GROUP BY Emp_Salary
		HAVING COUNT(Emp_Salary) > 1;

-- DUPLICATE SALARY RECORDS WITH SUBQUERY--

	SELECT Emp_Name, Emp_Salary
	FROM Employees 
	WHERE Emp_Salary IN 
	(
		SELECT  Emp_Salary 
		FROM Employees 
		GROUP BY Emp_Salary
		HAVING COUNT(Emp_Salary) >1

	);
		
--FIND THE EMPLOYEE DETAILS WHICH EMPLOYEE HAVE 2ND HIGHEST SALARY--
	
		WITH Employees_cte AS 
		(
			SELECT * , DENSE_RANK() OVER (ORDER BY Emp_Salary DESC) AS Rank 
			FROM Employees
			)
			select *
			FROM Employees_cte
			WHERE Rank = 2;

--FETCH THOSE PASSENGERS WHO HAS HIGHEST NO.OF BOOKING 
--DISPLAY PASSENGERID,NAME,GENDER,HIGHEST NO.OF BOOKING ,TOTALFARE?
	

	CREATE TABLE Passengers
	(
		PassengerID INT PRIMARY KEY , 
		Name NVARCHAR(50),
		Gender NVARCHAR(50)

	);


	CREATE TABLE Booking 
	(
		BookingID INT PRIMARY KEY, 
		PassengerID INT, 
		TotalFare INT,
		FOREIGN KEY (PassengerID) REFERENCES Passengers (PassengerID)
	);

	SELECT * FROM Passengers;

	SELECT * FROM Booking;

	INSERT INTO Passengers (PassengerID,Name,Gender)
	VALUES (1,'Eram','Female'),(2,'Hassan','Male'),
	(3,'Afsar','Male'),(4,'Zishan','Male'),(5,'Hamdan','Male');


	INSERT INTO Booking (BookingID,PassengerID,TotalFare) 
	VALUES (101,1,500),(102,2,455),(103,3,555),(104,4,745),
	(105,5,600);

	INSERT INTO Booking (BookingID,PassengerID,TotalFare)
	VALUES (6,1,662),(7,1,600),(8,1,552),(9,2,700),(10,3,350),
	(11,4,440),(12,5,660);

	SELECT Name ,COUNT (*) AS [Highest no of booking]
	FROM Passengers
	JOIN Booking 
	ON Passengers.PassengerID = Booking.PassengerID
	GROUP BY Name
	ORDER BY [Highest no of booking] DESC;
	
--FETCH THOSE PASSENGERS WHO HAS HIGHEST NO.OF BOOKING 

	SELECT TOP 1 Name ,COUNT (*) AS [Highest no of booking]
	FROM Passengers
	JOIN Booking 
	ON Passengers.PassengerID = Booking.PassengerID
	GROUP BY Name
	ORDER BY [Highest no of booking] DESC;

--DISPLAY PASSENGERID,NAME,GENDER,HIGHEST NO.OF BOOKING ,TOTALFARE?

	SELECT P.PassengerID, P.Name,P.Gender, COUNT(B.BookingID) AS [Highest no of booking],SUM(B.TotalFare) AS [Total Fare]
	FROM Passengers  P
	JOIN Booking  B
	ON P.PassengerID = B.PassengerID
	GROUP BY P.PassengerID,P.Name,P.Gender;


--FETCH THOSE PASSENGERS WHO HAS TO SPEND HIGHEST FARE ON BOOKING TICKETS--

	SELECT TOP 1 Name, SUM(TotalFare) AS Highestspend
	FROM Passengers
	JOIN Booking 
	ON Passengers.PassengerID = Booking.PassengerID
	GROUP BY Name
	ORDER BY  Highestspend  DESC;

--DISPLAY PassengerID , NAME ,GENDER , HIGHEST NO.OF BOOKING , TOTAL FARE--

	SELECT TOP 1  P.PassengerID, P.Name,P.Gender, COUNT(B.BookingID) AS [Highest no of booking],SUM(B.TotalFare) AS [Total Fare]
	FROM Passengers  P
	JOIN Booking  B
	ON P.PassengerID = B.PassengerID
	GROUP BY P.PassengerID,P.Name,P.Gender;
	

--HOW CAN YOU USE A SUBQUERY TO FINF Employees whose salary is above the average salary--

	SELECT * FROM Employees;

	SELECT Emp_ID,Emp_Name,Emp_Salary ,Email,Contact_No
	FROM Employees 
	WHERE Emp_Salary > (SELECT AVG(Emp_Salary) FROM Employees);

--HOW CAN WE DELETE DUPLICATE RECORDS IN A TABLE WITHOUT ID COLUMN--

--FETCH ALL THE CUSTOMERS RECORDS WHO HAVE MORE THAN  MORE THAN ONE/TWO DUPLICATE RECORDS BASED ON THEIR ON FIRST AND LAST NAME--

	
		CREATE TABLE Customers 
		(
			ID INT PRIMARY KEY,
			First_Name NVARCHAR(50),
			Last_Name NVARCHAR(50),
			Gender NVARCHAR(50),
			Contact_No INT,
			Email NVARCHAR(50)
		);
		
	
		INSERT INTO Customers (ID,First_Name,Last_Name,Gender,Contact_No,Email)
		VALUES (1,'Eram','Fatma','Female',993164306,'eram2k11@gmail.com'),
		(2,'Hamdan','Imam','Male',778866772,'h.h@gmail.com'),
		(3,'Eram','Fatma','Female',887755441,'eram117@gmail.com'),
		(4,'Eram','Fatma','Female',22554477,'fatma.f@gmail.com'),
		(5,'Hamdan','Imam','Male',778844554,'h.imam@gmail.com');

		SELECT * FROM Customers;

		SELECT * FROM (SELECT * , COUNT(*) OVER (PARTITION BY First_Name,Last_Name) AS [Total Count]
		FROM Customers) AS Customerrecords
		WHERE [Total Count] > 1;


--HOW CAN WE DELETE DUPLICATE RECORDS IN A TABLE WITHOUT ID COLUMN--

	CREATE TABLE Student 
	(
		Rollno INT Identity(1,1) PRIMARY KEY,
		Name NVARCHAR(50),
		Course NVARCHAR(50),
		Contactno INT,
		Email NVARCHAR(50),
		DateofBirth DATE 
	);

	INSERT INTO Student (Name,Course,Contactno,Email,DateofBirth)
	VALUES ('Sam','CSE',77889944,'sam11@gmail.com','02-01-1993'),
		   ('Tom','CSE',66554477,'tom123@gmail.com','10-02-1991'),
		   ('Sara','IT',8877554,'sar67@gmail.com','02-01-2004'),
		   ('Sam','CSE',77889944,'sam11@gmail.com','02-01-1993'),
		   ('John','EEE',5522441,'john12@gmail.com','04-05-2004'),
		   ('Ahmad','CIVIL',887755442,'ahmad65@gmail.com','05-08-2006'),
		   ('John','EEE',5522441,'john12@gmail.com','04-05-2004');

	SELECT * FROM Student;

	
	WITH Student_cte AS (
		SELECT Name ,Course, Email,
		ROW_NUMBER( ) OVER (PARTITION BY Name,Course ORDER BY Email) AS row_number 
		FROM Student
	)

	DELETE  S
	FROM Student S
	JOIN Student_cte SC
		ON S.Name = SC.Name
		AND S.Course = SC.Course
		AND S.Email = SC.Email
		WHERE SC.row_number > 1;


