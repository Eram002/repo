--update statement--
select * from Employee1;
update Employee1
set Name = 'ahmaed zain'
where Id = 103;
--update multiple field--
update Employee1
set Name= 'ANAM',Manager_Id= 102
where Id =101;
--create a table--
CREATE TABLE table1 (column1 INT,column2 INT,column3 varchar(100));
select * from table1;
INSERT INTO table1 (column1,column2,column3)values
(SELECT 1,11,'FIRST'
UNION ALL 
SELECT 11,12,'SECOND'
UNION ALL 
SELECT 21,13,'THIRD'
UNION ALL 
SELECT 31,14,'FOURTH');
union