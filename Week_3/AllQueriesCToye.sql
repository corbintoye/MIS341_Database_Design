/* Q1 */
CREATE VIEW CustomerAddresses AS
SELECT cust.CustomerID, EmailAddress, LastName, FirstName,
    bill.Line1 AS BillLine1, bill.Line2 AS BillLine2,
    bill.City AS BillCity, bill.State AS BillState, bill.ZipCode AS BillZip,
    ship.Line1 AS ShipLine1, ship.Line2 AS ShipLine2,
    ship.City AS ShipCity, ship.State AS ShipState, ship.ZipCode AS ShipZip
FROM Customers cust
    JOIN Addresses bill ON cust.BillingAddressID  = bill.AddressID
    JOIN Addresses ship ON cust.ShippingAddressID = ship.AddressID


/* Q2 */
SELECT CustomerID, LastName, FirstName, BillLine1

FROM CustomerAddresses


/* Q3 */
UPDATE CustomerAddresses

SET BillLine1 = '1990 Westwood Blvd.'
WHERE CustomerID = 8;


/* Q4 */
CREATE VIEW OrderItemProducts

AS
SELECT ordr.OrderID, OrderDate, TaxAmount, ShipDate,
       ProductName, ItemPrice, DiscountAmount, ItemPrice - DiscountAmount AS FinalPrice, Quantity,
       (ItemPrice - DiscountAmount) * Quantity AS ItemTotal
FROM Orders ordr
    JOIN OrderItems oi ON ordr.OrderID = oi.OrderID
    JOIN Products prod ON oi.ProductID = prod.ProductID
	

/* Q5 */
CREATE VIEW ProductSummary

AS
SELECT ProductName, COUNT(ProductName) AS OrderCount, SUM(ItemTotal) AS OrderTotal
FROM OrderItemProducts
GROUP BY ProductName


/* Q6 */
SELECT TOP 5 ProductName, OrderTotal
FROM ProductSummary
ORDER BY OrderTotal DESC

