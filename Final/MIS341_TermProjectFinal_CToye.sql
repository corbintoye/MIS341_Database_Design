/*
DDL and DML for MIS 341 Final
Corbin Toye
2022
*/


--Create database
USE [master]
IF DB_ID('FinalToye') IS NOT NULL
	DROP DATABASE FinalToye

CREATE DATABASE FinalToye
GO

USE [FinalToye]
GO


--Create tables
USE FinalToye;

CREATE TABLE Games (
game_id INT PRIMARY KEY NOT NULL,
game_name VARCHAR(35),
game_year INT,
media VARCHAR(15),
serialnum VARCHAR(30),
platform_id INT NOT NULL
);

CREATE TABLE Platforms (
platform_id INT PRIMARY KEY NOT NULL,
platform_name VARCHAR(15) NOT NULL
);

CREATE TABLE Laptops (
laptop_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(15),
model VARCHAR(20),
serialnum VARCHAR(30),
ram_id INT,
platform_id INT,
drive_id INT,
);

CREATE TABLE Desktops (
desktop_id INT PRIMARY KEY NOT NULL,
mobo_id INT,
cpu_id INT,
gpu_id INT,
drive_id INT,
ram_id INT,
case_id INT,
display_id INT,
platform_id INT,
psu_id INT,
cooling_id INT,
);

CREATE TABLE VintageSystems (
vintage_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
serialnum VARCHAR(30),
platform_id INT
);

CREATE TABLE Consoles (
console_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
condition VARCHAR(20),
platform_id INT
);

CREATE TABLE RAM (
ram_id INT PRIMARY KEY NOT NULL,
size VARCHAR(10),
capacity VARCHAR(10),
ram_standard VARCHAR(4),
speed INT,
ecc BIT,
brand VARCHAR(20)
);

CREATE TABLE Drives (
drive_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
drive_type VARCHAR(6),
capacity VARCHAR(10),
oddspeed INT,
hddspeed INT,
bus VARCHAR(10)
);

CREATE TABLE GPUs (
gpu_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
vram DECIMAL,
gpu_year INT,
condition VARCHAR(10),
gpuinterface VARCHAR(10)
);

CREATE TABLE CPUs (
cpu_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
socket VARCHAR(10),
ghz DECIMAL,
cores INT,
l1_cache INT
);

CREATE TABLE PSUs (
psu_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
watt INT,
pintype INT,
rating VARCHAR(10)
);

CREATE TABLE Cooling (
cooling_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
socket VARCHAR(10),
connector INT
);

CREATE TABLE Cases (
case_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
size VARCHAR(10),
condition VARCHAR(10)
);

CREATE TABLE Motherboards (
mobo_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
gpuinterface VARCHAR(10),
socket VARCHAR(10)
);

CREATE TABLE Displays (
display_id INT PRIMARY KEY NOT NULL,
brand VARCHAR(20),
model VARCHAR(20),
disp_year INT,
refreshrate INT,
connectortype VARCHAR(10),
resolution VARCHAR(12)
);

CREATE TABLE GameLogs (
game_id INT PRIMARY KEY NOT NULL,
event_type VARCHAR(15) NOT NULL
);

--Insert rows into tables

USE FinalToye;

INSERT INTO Games (game_id, game_name, game_year, media, serialnum, platform_id) VALUES
('1', 'COD', '2008', 'CD', '12345678', '1'),
('2', 'BF4', '2014', 'Digital', '1111111', '2'),
('3', 'DOOM', '1995', 'Cartridge', '22222', '3'),
('4', 'Space Invaders', '1985', 'Cartridge', '121212', '4'),
('5', 'Gran Turismo 3', '2006', 'CD', '333333333', '5');

INSERT INTO Platforms (platform_id, platform_name) VALUES
('1', 'Windows'),
('2', 'Xbox'),
('3', 'SEGA Genesis'),
('4', 'TI-99'),
('5', 'PS2'),
('6', 'C64'),
('7', 'macOS'),
('8', 'PS3'),
('9', 'iOS'),
('10', 'Android'),
('11', 'N64');

INSERT INTO Laptops (laptop_id, brand, model, serialnum, ram_id, platform_id, drive_id) VALUES
('1', 'Dell', 'Latitude', '1234', '5', '1', '5'),
('2', 'IBM', 'Thinkpad', '1111', '6', '1', '6'),
('3', 'HP', 'Envy', '2222', '7', '1', '7'),
('4', 'Samsung', 'NP300E5A', '1323', '8', '1', '8');

INSERT INTO Desktops (desktop_id, mobo_id, cpu_id, gpu_id, drive_id, ram_id, case_id, display_id, platform_id, psu_id, cooling_id) VALUES
('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2'),
('3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3'),
('4', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4');

INSERT INTO VintageSystems (vintage_id, brand, model, serialnum, platform_id) VALUES
('1', 'SEGA', 'Genesis', '5555', '3'),
('2', 'Commodore', '64', '7777', '6'),
('3', 'Apple', 'Apple II', '3535', '7'),
('4', 'Texas Instruments', 'TI-99', '3636', '4');

INSERT INTO Consoles (console_id, brand, model, condition, platform_id) VALUES
('1', 'Xbox', 'First-gen', 'parts', '2'),
('2', 'Sony', 'PS2 Slim', 'working', '5'),
('3', 'Sony', 'PS3', 'working', '8'),
('4', 'Nintendo', 'N64', 'working', '11');

INSERT INTO RAM (ram_id, size, capacity, ram_standard, speed, ecc, brand) VALUES
('1', 'SODIMM', '1GB', 'DDR3', '1333', '0', 'Samsung'),
('2', 'DIMM', '2GB', 'DDR3', '1333', '0', 'HP'),
('3', 'DIMM', '2GB', 'DDR3', '1333', '0', 'HP'),
('4', 'SODIMM', '4GB', 'DDR4', '3000', '0', 'Corsair');

INSERT INTO Drives (drive_id, brand, model, drive_type, capacity, oddspeed, hddspeed, bus) VALUES
('1', 'WD', 'Blue', 'HDD', '500GB', NULL, '5400', 'SATA'),
('2', 'Seagate', 'Barracuda', 'HDD', '1TB', NULL, '7200', 'SATA'),
('3', 'Samsung', '970 EVO', 'SSD', '500GB', NULL, NULL, 'M.2'),
('4', 'WD', 'Black', 'HDD', '1TB', NULL, '7200', 'SATA');

INSERT INTO GPUs (gpu_id, brand, model, vram, gpu_year, condition, gpuinterface) VALUES
('1', 'NVIDIA', 'GT710', '1', '2010', 'parts', 'PCIe'),
('2', 'AMD', 'RX 480', '4', '2014', 'working', 'PCIe'),
('3', 'NVIDIA', 'GTX1660', '6', '2016', 'working', 'PCIe'),
('4', 'NVIDIA', 'AXEL3D 7950', '0.5', '2002', 'working', 'AGP');

INSERT INTO CPUs (cpu_id, brand, model, socket, ghz, cores, l1_cache) VALUES
('1', 'Intel', 'i3 2330', NULL, '2.2', '2', NULL),
('2', 'AMD', 'R3 2300X', 'AM4', '3.6', '4', NULL),
('3', 'AMD', 'R5 2600', 'AM4', '3.4', '6', NULL),
('4', 'Intel', 'Core 2 Duo', '2.2', '775', '2', NULL);

INSERT INTO PSUs (psu_id, brand, model, watt, pintype, rating) VALUES
('1', 'Antec', NULL, '500', '6', '80+ Silver'),
('2', 'Corsair', NULL, '800', '8', '90+ Gold'),
('3', 'EVGA', NULL, '400', '6', '80+'),
('4', 'Corsair', 'Model2', '1000', '8', '80+ Silver');

INSERT INTO Cooling (cooling_id, brand, model, socket, connector) VALUES
('1', 'Noctua', '100', 'AM4', '3'),
('2', 'Intel', 'Stock', '775', '3'),
('3', 'AMD', 'Wraith', 'AM4', '4'),
('4', 'be quiet!', NULL, 'AM3+', '3');

INSERT INTO Cases (case_id, brand, model, size, condition) VALUES
('1', 'HP', 'Grey', 'ATX', 'Clean'),
('2', 'Dell', 'XPS410', 'mATX', 'Scratched'),
('3', 'HP', NULL, 'ITX', 'Clean'),
('4', 'Corsair', NULL, 'ATX', 'New');

INSERT INTO Motherboards (mobo_id, brand, model, gpuinterface, socket) VALUES
('1', 'ASRock', 'A320M', 'PCIe3', 'AM4'),
('2', 'ASROCK', 'A320M', 'PCIe3', 'AM4'),
('3', 'Dell', NULL, 'PCIe2', 'AM3'),
('4', 'MSI', NULL, 'PCIe4', 'AM5');

INSERT INTO Displays (display_id, brand, model, disp_year, refreshrate, connectortype, resolution) VALUES
('1', 'MSI', '27', '2020', '144', 'DP', '1920x1080'),
('2', 'Dell', '20', '2010', '55', 'VGA', '1280x768'),
('3', 'Acer', '24', '2018', '75', 'HDMI', '1920x1080'),
('4', 'Sceptre', '22', '2019', '144', 'DP', '1920x1080');

--Create index
CREATE INDEX ind_platform
ON Platforms (platform_id);


----------------------Procedures, Functions, and Triggers------------------------------

--Procedure that inserts a game into the Games table
USE FinalToye
GO
CREATE PROC PrInsertGame
@game_id INT,
@game_name VARCHAR,
@game_year INT,
@media VARCHAR,
@serialnum VARCHAR,
@platform_id INT

AS

IF @game_id IS NULL THROW 50000, 'Game ID is required', 1;
IF @platform_id IS NULL THROW 50001, 'Platform ID is required', 1;

BEGIN TRANSACTION
BEGIN TRY

INSERT INTO Games (game_id, game_name, game_year, media, serialnum, platform_id) VALUES
(
@game_id,
@game_name,
@game_year,
@media,
@serialnum,
@platform_id
)
COMMIT TRANSACTION
END TRY

BEGIN CATCH
ROLLBACK TRANSACTION
PRINT 'Invalid input. Try again';
THROW;
END CATCH;

--Procedure that updates a game name in the Games table
USE FinalToye
GO
CREATE PROC PrUpdateGameName
@game_id INT,
@game_name VARCHAR

AS

IF @game_id IS NULL THROW 50000, 'Game ID is required', 1;

BEGIN TRANSACTION
BEGIN TRY

UPDATE Games
SET game_name = @game_name
WHERE game_id = @game_id
COMMIT TRANSACTION
END TRY

BEGIN CATCH
ROLLBACK TRANSACTION
PRINT 'Invalid input. Try again';
THROW;
END CATCH;

--Procedure that deletes a game entry from the Games table
USE FinalToye
GO
CREATE PROC PrDeleteGame
@game_id INT

AS

IF @game_id IS NULL THROW 50000, 'Game ID is required', 1;

BEGIN TRANSACTION
BEGIN TRY

DELETE FROM Games
WHERE game_id = @game_id

COMMIT TRANSACTION
END TRY

BEGIN CATCH
ROLLBACK TRANSACTION
PRINT 'Game does not exist. Enter new ID';
THROW;
END CATCH;

--Function that returns a game ID when given a game name
USE FinalToye
GO
CREATE FUNCTION FnGameIDFinder(@game_name VARCHAR)
RETURNS INT
BEGIN
RETURN
(
SELECT game_id
AS Game_ID_Number
FROM Games
WHERE game_name = @game_name
)
END;

--Function that returns all CPUs that are greater than or equal to a given clock speed
USE FinalToye
GO
CREATE FUNCTION FnCPUFinder(@ghz DECIMAL)
RETURNS INT
BEGIN
RETURN
(
SELECT cpu_id
FROM CPUs
WHERE ghz = @ghz OR ghz > @ghz
)
END;

--Function that returns a count of how many game entries exist for a given platform
USE FinalToye
GO
CREATE FUNCTION FnGameCounter(@platform_id INT)
RETURNS INT
BEGIN
RETURN
(
SELECT COUNT(*)
AS GameCount
FROM Games
WHERE platform_id = @platform_id
)
END;

--Trigger that fires on INSERT procedure
USE FinalToye
GO
CREATE TRIGGER TrgInsert
ON Games
FOR INSERT AS
BEGIN
INSERT INTO GameLogs(game_id, event_type)
SELECT game_id, event_type = 'I'
FROM INSERTED
END;

--Trigger that fires on UPDATE procedure
USE FinalToye
GO
CREATE TRIGGER TrgUpdate
ON Games
FOR UPDATE AS
BEGIN
INSERT INTO GameLogs(game_id, event_type)
SELECT game_id, event_type = 'U'
FROM INSERTED
END;

--Trigger that fires on DELETE procedure
USE FinalToye
GO
CREATE TRIGGER TrgDelete
ON Games
FOR DELETE AS
BEGIN
INSERT INTO GameLogs(game_id, event_type)
SELECT game_id, event_type = 'D'
FROM INSERTED
END;