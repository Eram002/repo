SELECT ASCII('A');

SELECT CHAR(65);

--PRINT A CAPITAL LETTER A-Z--

	Declare @Start INT
	SET @Start = 65
	WHILE (@Start <= 90)
	BEGIN 
		PRINT CHAR (@Start)
		SET @Start = @Start + 1
	END


--PRINT A SMALL LETTER a-z--

SELECT ASCII('a');

	Declare @Start INT 
	SET @Start = 97
	WHILE (@Start <= 122)
	BEGIN 
		PRINT CHAR (@Start)
		SET @Start = @Start + 1
	END

--PRINT A NUMBER FROM 0-9--

SELECT ASCII('0');

	Declare @Start INT 
	SET @Start = 48
	WHILE (@Start <= 57)
	BEGIN 
		PRINT CHAR (@Start)
		SET @Start = @Start + 1
	END 