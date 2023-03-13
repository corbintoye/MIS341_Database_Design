/* Q1 */
CREATE PROC spInsertCategory
@CategoryName VARCHAR(50)
AS INSERT INTO Categories(CategoryName) VALUES (@CategoryName);
GO
EXEC spInsertCategory 'Picks';
GO
EXEC spInsertCategory 'Cables';


/* Q2 */
CREATE FUNCTION fnDiscountPrice(@ItemID INT)
RETURNS DECIMAL

BEGIN
RETURN 
(
SELECT ItemPrice - DiscountAmount AS DiscountPrice
FROM OrderItems
WHERE ItemID = @ItemID
)
END


/* Q3 */
CREATE FUNCTION fnItemTotal(@ItemID INT)
RETURNS DECIMAL
BEGIN
RETURN 
(
SELECT dbo.fnDiscountPrice(@ItemId) *
(
SELECT Quantity
FROM OrderItems
WHERE ItemID = @ItemID
)
)
END


/* Q4 */
CREATE PROC spInsertProduct
@CategoryID INT,
@ProductCode VARCHAR,
@ProductName VARCHAR,
@ListPrice DECIMAL,
@DiscountPercent DECIMAL
AS

BEGIN
IF @ListPrice < 0 THROW 51000, 'List Price must be a positive value.', 1;
IF @DiscountPercent < 0 THROW 51000, 'Discount Percentage must be a positive value', 1;
INSERT INTO PRODUCTS (CategoryID, ProductCode, ProductName, ListPrice, DiscountPercent, Description, DateAdded)
VALUES (@CategoryID, @ProductCode, @ProductName, @ListPrice, @DiscountPercent, NULL, GETDATE());
END;

GO
EXEC spInsertProduct 1, 'A', 'Red Pick', 2, .10;
GO
EXEC spInsertProduct 2, 'B', 'XLR Cable', -1, -.20;


/* Q5 */
