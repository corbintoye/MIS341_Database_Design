
/* Q1 */
USE MyGuitarShop;

DECLARE @CountVar int;

SET @CountVar = (SELECT COUNT(ProductName)
FROM Products);

IF @CountVar > 0 PRINT'The number of products is greater than or equal to 7';
ELSE PRINT'The number of products is less than 7';


/* Q2 */