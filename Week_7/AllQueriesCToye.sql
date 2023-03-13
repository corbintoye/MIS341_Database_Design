/* Q1 */
CREATE ROLE OrderEntry;

GRANT INSERT, UPDATE ON Orders TO OrderEntry;
GRANT INSERT, UPDATE ON OrderItems TO OrderEntry;
GRANT SELECT ON SCHEMA::dbo TO OrderEntry;

/* Q2 */
CREATE LOGIN RobertHalliday WITH PASSWORD = 'HelloBob',
DEFAULT_DATABASE = MyGuitarShop;

CREATE USER RobertHalliday FOR LOGIN RobertHalliday;
ALTER ROLE OrderEntry ADD MEMBER RobertHalliday;

/* Q3 */
DECLARE @Administrators TABLE(Fname VARCHAR(50),Lname VARCHAR(50));
DECLARE @DynamicSQL VARCHAR (255);
DECLARE @FirstName VARCHAR(50), @LastName VARCHAR(50);
DECLARE AdminCursor CURSOR  LOCAL FAST_FORWARD FOR
SELECT Fname, Lname
FROM @Administrators
OPEN AdminCursor;

FETCH NEXT FROM AdminCursor INTO @FirstName, @LastName;
WHILE (@@FETCH_STATUS = 0)
BEGIN
SET @DynamicSQL = 'CREATE LOGIN ' + QUOTENAME(@FirstName + @LastName) + ' WITH PASSWORD = ''temp'' ,CHECK_POLICY  = off';
EXEC(@DynamicSQL);

SET @DynamicSQL = 'CREATE USER ' + QUOTENAME(@FirstName + @LastName) + ' FOR LOGIN' + QUOTENAME(@FirstName + @LastName) + ';'
EXEC(@DynamicSQL)

SET @DynamicSQL = 'ALTER ROLE OrderEntry ADD MEMBER ' + QUOTENAME(@FirstName + @LastName) +';'
EXEC(@DynamicSQL)

FETCH NEXT FROM AdminCursor INTO @FirstName, @LastName;
END;

/* Q5 */
ALTER ROLE OrderEntry DROP MEMBER RBrautigan;
ALTER ROLE OrderEntry DROP MEMBER RobertHalliday;
DROP ROLE OrderEntry;

/* Q6 */
GO
CREATE SCHEMA Admin;

GO
ALTER SCHEMA Admin TRANSFER dbo.Addresses;
ALTER USER RobertHalliday WITH DEFAULT_SCHEMA = Admin;
GRANT SELECT, UPDATE, INSERT, DELETE, EXECUTE ON SCHEMA :: Admin TO RobertHalliday;