--SELF JOIN--
CREATE TABLE Agent 
(
	ID INT NOT NULL,
	Name NVARCHAR(50),
	Salary INT,
	DOB DATE,
	ManagerId INT,

	PRIMARY KEY (ID)

);

	INSERT INTO Agent (ID,Name,Salary,DOB,ManagerId)
	VALUES (101,'Jack',2000,'1991-02-10',104),
		   (102,'Sam',NULL,NULL,109),
		   (103,'Mark',6000,'1997-12-05',109),
		   (104,'Peter',4000,'1993-01-02',101),
		   (105,'Tom',3000,'1994-02-01',NULL),
		   (106,'Sara',2500,'1997-10-10',109),
		   (107,'Maxwell',5300,'1997-10-06',110),
		   (108,'Bob',4500,'1994-02-01',NULL),
		   (109,'Pinky',5800,'1998-08-12',105),
		   (110,'Ahmad',7500,'1990-02-01',103);


SELECT * FROM Agent;


	SELECT 
	A1.ID AS ID ,A1.Name AS Name,A2.Name AS ManagerName
	FROM Agent A1
	INNER JOIN Agent A2
	ON A1.ManagerId = A2.ID;
