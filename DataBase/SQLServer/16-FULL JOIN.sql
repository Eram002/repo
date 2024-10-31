--FULL JOIN--

CREATE TABLE Students
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(50),
	Branch NVARCHAR(50),
	Roll_No INT
);

	INSERT INTO Students(Name,Branch,Roll_No) 
	VALUES ('Eram fatma', 'CSE', 1101),
		   ('Afsar Ahmad', 'Civil',1102),
		   ('zishan Ahmad', 'Civil',1103),
		   ('Hassan Ahmad', 'ECE',1104),
		   ('Sara Safa', 'ME',1105);

		

CREATE TABLE Library 
(
	Book_ID INT IDENTITY (1,1) PRIMARY KEY,
	Book_Name NVARCHAR(50),
	Issue_Date DATE,
	Due_Date DATE
);

		INSERT INTO Library (Book_Name,Issue_Date,Due_Date)
		VALUES ('RD SHARMA', '2024-10-30', '2024-11-08'),
			   ('DENNIS RICHIE','2024-10-31','2024-11-09'),
			   ('MORRIS MANO','2024-11-01','2024-11-15'),
			   ('COMPILER DESIGN','2024-08-07','2024-07-08'),
			   ('JOSEPH EDWARD','2024-03-07','2024-07-11');


		SELECT * FROM Students;

		SELECT * FROM Library;
		
--FULL JOIN--

	SELECT Students.Name,Students.Branch,Library.Book_Name,Library.Issue_Date
	FROM Students
	FULL JOIN Library
	ON Students.ID = Library.ID;

--FULL JOIN WITH WHERE CLAUSE--
	SELECT Students.Name,Students.Branch,Library.Book_Name,Library.Issue_Date
	FROM Students
	FULL JOIN Library
	ON Students.ID = Library.ID
	WHERE Book_Name  LIKE '%COMPILER DESIGN';
	
--FULL OUTER JOIN WITH ORDER BY CLAUSE--
	SELECT * FROM Students
	FULL OUTER JOIN Library
	ON Students.ID = Library.ID 
	ORDER BY Students.Name;

-- ORDER BY CLAUSE WITH DESC--

	SELECT * FROM Students
	FULL OUTER JOIN Library
	ON Students.ID = Library.ID 
	ORDER BY Students.Name DESC;

--GROUP BY CLAUSE--

	SELECT Students.Branch , COUNT(*) AS Department
	FROM Students
	FULL JOIN Library
	ON Students.ID = Library.ID
	GROUP BY Students.Branch;

--HAVING CLAUSE--
 SELECT Students.Name , COUNT(*) AS Total
 FROM Students
 FULL JOIN Library
 ON Students.ID = Library.ID 
 GROUP BY Students.Name 
 HAVING  Name LIKE '%S%';