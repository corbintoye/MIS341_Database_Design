/* Q1 */

USE MyGuitarShop;
CREATE INDEX AddressesZipCode
ON Addresses (ZipCode);



/* Q2 */

USE MASTER;
IF EXISTS
(SELECT * FROM sys.databases
WHERE NAME='MyWebDB')
DROP DATABASE MyWebDB;
GO

CREATE DATABASE MyWebDB;
GO

USE MyWebDB;
CREATE TABLE Users
(UserID	INT	NOT NULL PRIMARY KEY,
EmailAddress VARCHAR(50) NULL,
FirstName VARCHAR(50) NULL,
LastName VARCHAR(50) NULL);

CREATE TABLE Products
(ProductID INT NOT NULL PRIMARY KEY,
ProductName	VARCHAR(50) NULL);

CREATE TABLE Downloads
(DownloadID	INT	NOT NULL PRIMARY KEY,
UserID	INT	NOT NULL REFERENCES Users (UserID),
DownloadDate SMALLDATETIME NULL,
FileName VARCHAR(50) NULL,
ProductID INT NOT NULL REFERENCES Products (ProductID));

CREATE INDEX Downloads_UserID_Index
ON Downloads (UserID);



/* Q3 */

USE MyWebDB;
INSERT INTO Users
VALUES (1, 'joe@oit.com', 'Joe', 'Biden'),
(2, 'steve@oit.com', 'Steve', 'Jobs');

GO
INSERT INTO Products
VALUES(1, 'Green Tea'),
(2, 'Red Bull');

GO
INSERT INTO Downloads
VALUES(1, 1, getdate(), 'homework.docx', 2),
(2, 2, getdate(), 'presentation.ppt', 1),
(3, 2, getdate(), 'notes.docx', 2);

GO
SELECT u.EmailAddress AS email_address, u.FirstName AS first_name, u.LastName AS last_name, d.DownloadDate AS download_date, d.FileName AS filename, p.ProductName AS product_name
FROM Downloads d
join Users u
ON u.UserID = d.UserID
join Products p
ON p.ProductID = d.UserID



/* Q4 */

ALTER TABLE Products
ADD ProductPrice NUMERIC(5,2) DEFAULT 9.99;

GO
ALTER TABLE Products
ADD DateProductAdded SMALLDATETIME DEFAULT GETDATE();



/* Q5 */

ALTER TABLE Users
ALTER COLUMN FirstName VARCHAR(20) NOT NULL;

UPDATE Users
SET FirstName = NULL
WHERE UserID = 1;

UPDATE Users
SET FirstName = 'ThisisahilariouslylongfirstnameandIhopethisstatementfails'
WHERE UserID = 1;