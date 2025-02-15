USE Shopping_Cart
GO

CREATE TABLE User1
(
	UserID INT IDENTITY(1,1) PRIMARY KEY,
	UserName NVARCHAR(50),
	Email NVARCHAR(50),
	PasswordHash NVARCHAR(50)
);

INSERT INTO User1 (UserName,Email,PasswordHash)
VALUES('Sam','s123@gmail.com','sam123'),
('Tom','t123@gmail.com','tom123'),
('Sara','s123@gmail.com','sara123');

SELECT * FROM User1;

CREATE TABLE Products
(
	ProductID INT PRIMARY KEY,
	ProductName NVARCHAR(50),
	Price DECIMAL(10,2),
	StockQuantity INT 
);

INSERT INTO Products(ProductID,ProductName,Price,StockQuantity)
VALUES(101,'Laptop',1200.00,10),(102,'Mobile',800.00,15),
(103,'Tablet',1500.00,20);

SELECT * FROM Products;


CREATE TABLE Cart
(
	CartID INT PRIMARY KEY IDENTITY(1,1),
	UserID INT FOREIGN KEY References User1(UserID),
	ProductID INT FOREIGN KEY References Products(ProductID),
	Quantity INT, 
	Addedon DATETIME DEFAULT GETDATE()
);


INSERT INTO Cart(UserID,ProductID,Quantity)
VALUES(1,101,1),(2,102,2),(3,103,1);


SELECT * FROM User1;

SELECT * FROM Products;

SELECT * FROM Cart;

--Find all the items from users cart--

	SELECT c.CartID,U.UserName,P.ProductName,P.Price,C.Quantity,
	(P.Price * C.Quantity)AS Totalprice
	FROM Cart C 
	JOIN User1 U 
	ON C.UserID = U.UserID
	JOIN Products P
	ON C.ProductID = P.ProductID
	WHERE U.UserID = 1;


	SELECT c.CartID,U.UserName,P.ProductName,P.Price,C.Quantity,
	(P.Price * C.Quantity)AS Totalprice
	FROM Cart C 
	JOIN User1 U 
	ON C.UserID = U.UserID
	JOIN Products P
	ON C.ProductID = P.ProductID
	WHERE U.UserID = 3;

