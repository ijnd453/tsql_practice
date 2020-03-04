USE SalesLT;

--Problem 1: Query Unique Cities
SELECT DISTINCT City, StateProvince FROM Address;

--Problem 2: Retrieve the top ten percent of products by weight
SELECT TOP(10) PERCENT Name, Weight
FROM Product
ORDER BY Weight DESC;

--Problem 3: First 25 percent of rows not including the first 10 percent
SELECT Name, Color, Size, Weight
FROM Product
ORDER BY Weight DESC
OFFSET 4 ROWS
FETCH FIRST 10 ROWS ONLY;

--Use subqueries instead
SELECT TOP 10 Name, Color, Size, Weight
FROM Product
WHERE Weight < (SELECT P1.Weight
FROM Product P1
WHERE 3 = (SELECT COUNT(DISTINCT(P2.Weight))
FROM Product P2
WHERE P2.Weight > P1.Weight))
ORDER BY Weight DESC;

--Problem 4: 
SELECT Name, Color, Size, ProductModelID
FROM Product
WHERE ProductModelID=1;

--Problem 5:
SELECT Name, ProductNumber, Color, Size
FROM Product
WHERE Color IN ('black','red','white') AND Size IN ('S','M');

--Problem 6:
SELECT ProductNumber, Name, ListPrice
FROM Product
WHERE ProductNumber LIKE 'BK-%';

--Problem 7:
SELECT ProductNumber, Name, ListPrice
FROM Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';