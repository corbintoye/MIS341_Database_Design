/* Q1 */

SELECT ListPrice, DiscountPercent, ROUND((ListPrice*(DiscountPercent/100)),2) AS DiscountAmount
FROM Products

/* Q2 */

SET DATEFORMAT DMY;
SELECT OrderDate, YEAR(OrderDate) AS OrderYear, DAY(OrderDate) AS OrderDay, DATEADD(DD,30,OrderDate) AS FutureDate
FROM Orders

/* Q3 */

SELECT CardNumber, LEN(CardNumber) AS CardLength, RIGHT(CardNumber,4) AS LastFourDigit, CONCAT('XXXX-XXXX-XXXX-',RIGHT(CardNumber,4)) AS LastFourDigits
FROM Orders

/* Q4 */

SELECT OrderID, OrderDate, DATEADD(DAY,2,OrderDate) AS ApproxShipDate, DATEDIFF(DAY,OrderDate,DATEADD(DAY,2,OrderDate)) AS DaysToShip
FROM Orders
WHERE YEAR(OrderDate) = 2012 AND MONTH(OrderDate) = 3
