IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Products'))
BEGIN

CREATE TABLE Products
(
     ProductID int,
     ProductName varchar(1000),
     Quantity int
)
END