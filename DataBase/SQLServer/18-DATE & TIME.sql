	select * from Library;

--DATE--
	SELECT * FROM Library
	WHERE Issue_Date BETWEEN '2024-03-07' AND '2024-10-30';

	SELECT * FROM Library 
	WHERE Due_Date IN ('2024-07-11','2024-11-08','2024-11-15');
	
	SELECT GETDATE() AS TODAYDATE_TIME;

	CREATE TABLE Employee3
	(
		ID INT PRIMARY KEY,
		Hire date,
		LogIN DATETIME,
		LogOut DATETIME,

	);
    
	SELECT * FROM Employee3;

	INSERT INTO Employee3 (ID,Hire , [LogIN],[LogOut])
	VALUES (1,'03-11-2024','9:00','6:00'),
		   (2,'04-11-2024','10:00','5:00');

	SELECT * FROM Employee3
	WHERE Hire = '04-11-2024';

	SELECT * FROM Employee3 
	WHERE [LogIN] = '9:00';

	INSERT INTO Employee3 VALUES  (3,'05-11-2024','10:00','5:00');
	INSERT INTO Employee3 VALUES  (4,'04-11-2024','9:00','5:00');

	SELECT * FROM Employee3 
	WHERE Hire BETWEEN '03-11-2024'AND '04-11-2024';

