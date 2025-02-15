USE[sample2]
GO

--Clustered Index--

CREATE TABLE Student_Info
(
	Roll_No INT PRIMARY KEY,
	Name NVARCHAR(50),
	Dept NVARCHAR(50),
	Gender NVARCHAR(50),
	City NVARCHAR(50)
);

EXEC SP_HELPINDEX Student_Info

--Note :- The value for Roll_No not in sequential order.

	INSERT INTO Student_Info (Roll_No,Name,Dept,Gender,City)
	VALUES(103,'Hassan','ECE','Male','Samastipur'),
		  (101,'Eram','CES','Female','Hyderabad'),
		  (104,'Hamdan','Civil','Male','Dubai'),
		  (105,'Sara','EEE','Female','Delhi'),
		  (102,'Sam','IT','Male','Delhi');

	SELECT * FROM Student_Info;

--CREATE A INDEX

	CREATE INDEX My_INDEX
	ON Student_Info  (Name);

--VIEW THE INDEX

	SELECT * FROM Student_Info WITH (INDEX(My_INDEX));

	EXEC SP_HELPINDEX Student_Info

--DROP THE INDEX--

DROP INDEX Student_Info.MY_INDEX

--CREATE A CLUSTERED INDEX

	CREATE CLUSTERED INDEX IX_Dept_City
	ON Student_Info (Dept DESC,City ASC);

--CREATE Non-clustered INDEX

	CREATE NON-CLUSTERED INDEX IX_Name_Gender
	ON Student_Info (Name,Gender);

