--ALTER TABLE--
--SYNTAX--
	ALTER TABLE table_name
	ADD column_name datatype;

	SELECT * FROM Agent;

--EXAMPLE--
	
	ALTER TABLE Agent
	ADD Address NVARCHAR(50);

	UPDATE Agent 
	SET Address = 'Delhi'
	WHERE ID = 101;

--UPDATE WITH  USING CASE--

	UPDATE Agent
	SET Address = CASE 
		WHEN ID = 102 THEN 'Mumbai'
		WHEN ID = 103 THEN 'NewDelhi'
		WHEN ID = 104 THEN 'Noidasector-32'
		
	END 
	WHERE ID IN (102,103,104);

	UPDATE Agent 
	SET Address = CASE 
		WHEN ID = 106 THEN 'Delhi'
		WHEN ID = 107 THEN 'Kolkata'
		WHEN ID = 109 THEN 'Dubai'
		WHEN ID = 110 THEN 'Newdelhi'
	
	END
	WHERE ID IN (106,107,109,110);

--DROP A COLUMN--
	
--SYNTAX--
	ALTER TABLE table_name
	DROP COLUMN column_name

--EXAMPLE--
	ALTER TABLE Agent
	DROP COLUMN Salary;

--AND--
	SELECT * FROM Agent 
	WHERE Address = 'Delhi' AND Salary = 2000;