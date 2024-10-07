--INNER JOIN--

CREATE TABLE Student 
(
	Roll_No INT NOT NULL,
	Name  NVARCHAR(50) NOT NULL,
	Address   NVARCHAR(50) NOT NULL,
	Phone   INT ,
	Age     INT, 

);



INSERT INTO Student (Roll_No,Name,Address,Phone,Age) 
VALUES (1,'Harish','Delhi',987456879,18),
	   (2,'Deepak','Bihar',897456123,19),
	   (3,'Sam','Kolkata',654789123,20),
	   (4,'Raj','Noida',789456123,18),
	   (5,'Ahma','Aligarh',99888774,19);





CREATE TABLE Course1
(
	Course_ID INT, 
	Roll_No   INT,
);

INSERT INTO Course1 (Course_ID, Roll_No)
VALUES (1,1),(2,2),(2,3),(3,4),(1,5); 


SELECT * FROM Student;

SELECT * FROM Course1;


--Example--

--INNER JOIN--

	SELECT
	S.Roll_No,
	S.Name,
	S.Address,
	S.Phone,
	S.Age,
	C.Course_ID
	FROM Student  S
	INNER JOIN Course1   C
	ON S.Roll_No =  C.Roll_No;


	--SHOW THE NAME AND AGE OF THE STUDENTS ENROLLED IN DIFFERENT COURSES--

	SELECT C.Course_ID , S.Name,S.Age
	FROM Student S
	INNER JOIN Course1 C
	ON S.Roll_No = C.Roll_No;

--LEFT JOIN--


	SELECT
	S.Roll_No,
	S.Name,
	S.Address,
	S.Phone,
	S.Age,
	C.Course_ID  
	FROM Student S 
	LEFT JOIN Course1  C
	ON S.Roll_No = C.Roll_No;

--SHOW THE NAME  OF STUDENT ENROLLED IN COURSES--

	SELECT 
	S.Name,C.Course_ID
	FROM Student S 
	LEFT JOIN Course1  C 
	ON S.Roll_No = C.Roll_No;

--RIGHT JOIN--

	SELECT 
	S.Roll_No,
	S.Name,
	S.Address,
	S.Phone,
	S.Age,
	C.Course_ID
	FROM Student S 
	RIGHT JOIN Course1  C 
	ON S.Roll_No = C.Roll_No;

--Example--

	SELECT S.Name , C.Course_ID
	FROM Student S 
	RIGHT JOIN Course1 C 
	ON S.Roll_No = C.Roll_No;

--FULL JOIN--
	SELECT 
	S.Roll_No,
	S.Name,
	C.Course_ID
	FROM Student S 
	FULL JOIN  Course1 C
	ON S.Roll_No = C.Roll_No;

--Example--

	SELECT S.Name, C.Course_ID
	FROM Student  S
	FULL JOIN Course1 C 
	ON S.Roll_No = C.Roll_No;


--CROSS JOIN--
	SELECT 
	S.Roll_No,S.Name,S.Address,S.Phone,S.Age
	FROM Student S
	CROSS JOIN Course1 C;


	
