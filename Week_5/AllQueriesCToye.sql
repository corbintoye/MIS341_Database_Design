/* Q1 */
DECLARE
@ProductName VARCHAR(25),
@ListPrice DECIMAL;

DECLARE InvCursor CURSOR

FOR

SELECT ProductName, ListPrice
FROM Products
WHERE ListPrice > 700
ORDER BY ListPrice DESC;

OPEN InvCursor;

FETCH NEXT FROM InvCursor INTO @ProductName, @ListPrice;

WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @ProductName + '$' + CONVERT(VARCHAR,@ListPrice);
FETCH NEXT FROM InvCursor INTO @ProductName, @ListPrice;
END;

CLOSE InvCursor;
DEALLOCATE InvCursor;



/* Q2 */
DECLARE
@LastName VARCHAR(20),
@AvgShipAmount DECIMAL;

DECLARE ShipCursor CURSOR
FOR

SELECT LastName, AVG(ShipAmount) AS ShipAmountAvg
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY LastName;

OPEN ShipCursor;
FETCH NEXT FROM ShipCursor

WHILE @@FETCH_STATUS = 0
BEGIN
FETCH NEXT FROM ShipCursor
END;

CLOSE ShipCursor;
DEALLOCATE ShipCursor;



/* Q3 */
DECLARE
@LastName VARCHAR(20),
@AvgShipAmount DECIMAL;

DECLARE ShipCursor CURSOR
FOR

SELECT LastName, AVG(ShipAmount) AS ShipAmountAvg
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY LastName;

OPEN ShipCursor;
FETCH NEXT FROM ShipCursor INTO @LastName, @AvgShipAmount;

WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @LastName + ' $' + CONVERT(VARCHAR,@AvgShipAmount);
FETCH NEXT FROM ShipCursor INTO @LastName, @AvgShipAmount;
END;

CLOSE ShipCursor;
DEALLOCATE ShipCursor;