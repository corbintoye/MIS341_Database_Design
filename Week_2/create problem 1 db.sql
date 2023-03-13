Create Database Sample

Create Table Product
(
PROD_CODE VARCHAR (50),
PROD_QOH INT
);

Create Table Part
(
PART_CODE VARCHAR (50),
PART_QOH INT
);


INSERT INTO Product (PROD_CODE, PROD_QOH)
VALUES ('ABC', '1205');

INSERT INTO Part (PART_CODE, PART_QOH)
VALUES ('A', '567'), ('B', '98'), ('C', '549');
