CREATE TABLE Products 
(
	ID INT Identity(1,1) PRIMARY KEY,
	Name NVARCHAR(50),
	Description NVARCHAR(50)

);

	INSERT INTO Products (Name,Description) 
	VALUES ('TV', '40 inch black color LCD TV'),
		   ('Laptop','Black color macbook air'),
		   ('Desktop','apple high performance desktop');


CREATE TABLE Productsales 
(
	ID INT Identity(1,1) PRIMARY KEY,
	ProductId INT Foreign key references Products(ID),
	Unitprice INT,
	Quantitysold INT

);

		INSERT INTO Productsales(ProductId,Unitprice,Quantitysold)
	    VALUES (3,4450,5),(2,55250,7),(3,4450,4),(3,4450,9);

	SELECT * FROM Products;

	SELECT * FROM Productsales;

--find the which product we have not sold--

	SELECT ID, Name, Description 
	FROM Products
	WHERE ID NOT IN (SELECT DISTINCT ProductId FROM Productsales);

--EXAMPLE--
	
	SELECT ID,Name,Description
	FROM Products
	WHERE ID IN (SELECT ID FROM Productsales WHERE ProductId = 3);
	
	SELECT * FROM Employees;

--Find the Avg Salary of Employee--

	SELECT E_Name,E_Department,E_Gender,
	(SELECT AVG(E_Salary) FROM Employees ) AS Avg_Pay
	FROM Employees;

	SELECT AVG(E_Salary) FROM Employees;

	SELECT E_ID,E_Name 
	FROM Employees 
	WHERE E_ID IN (SELECT DISTINCT ID 
	FROM Products WHERE ID IS NOT NULL) ;

	SELECT E_ID,E_Name 
	FROM Employees 
	WHERE E_ID NOT IN (1,2,3);

--INNER JOIN-

	SELECT Products.ID, Products.Name,Products.Description
	FROM Products
	INNER JOIN Productsales 
	ON Products.ID = Productsales.ProductId ;

--LEFT JOIN--

	SELECT Products.ID, Products.Name,Products.Description
	FROM Products
	LEFT JOIN Productsales 
	ON Products.ID = Productsales.ProductId ;

--FIND THE NON-MATCHNIG ROWS FROM BOTH TABLES--

	SELECT Products.ID, Products.Name,Products.Description
	FROM Products
	LEFT JOIN Productsales 
	ON Products.ID = Productsales.ProductId 
	WHERE Productsales.ProductId IS  NULL;
	
--FIND THE NAME OF PRODUCT AND QUANTITYSOLD--
	
	 SELECT Name,
		(SELECT SUM(Quantitysold) FROM Productsales WHERE ProductId = Products.ID) AS QTYSOLD
	 FROM Products
	 ORDER BY Name;

--WITH LEFT JOIN--

	SELECT Products.Name , SUM (Quantitysold) AS QTYSOLD
	FROM Products
	LEFT JOIN Productsales 
	ON Products.ID = Productsales.ProductId 
	GROUP BY Name;




--non correlated subquery--

	SELECT ID ,Name, Description 
	FROM Products 
	WHERE ID  NOT IN (SELECT DISTINCT ProductId FROM Productsales);

	
	SELECT * FROM Products;

	SELECT * FROM Productsales;

--CORRELATED SUBQUERY--

	SELECT Name,
		(SELECT SUM (Quantitysold) FROM Productsales WHERE ProductId = Products.ID ) AS QTYSOLD
	FROM Products ORDER BY Name;