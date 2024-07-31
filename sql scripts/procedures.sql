USE BrazilCommerceDB
;
GO

CREATE PROCEDURE InsertProducts
@ProductID VARCHAR(60),
@ProductCategory VARCHAR(80),
@PhotosQuantity INT,   
@Weight INT,
@Length INT,
@Height INT,
@Width INT
AS
BEGIN
INSERT INTO Products (
ProductID,
ProductCategory,
PhotosQuantity,   
Weight,
Length,
Height,
Width
)
VALUES (
@ProductID,
@ProductCategory,
@PhotosQuantity,   
@Weight,
@Length,
@Height,
@Width
)
SELECT SCOPE_IDENTITY() AS NewProduct
END
;
GO 

CREATE PROCEDURE RemoveProduct
@ProductID VARCHAR(60)
AS
BEGIN 
DELETE FROM Products
WHERE ProductID = @ProductID
END
;
GO

CREATE PROCEDURE UpdateProductsPhotoQuantity
@PhotosQuantity INT,
@ProductID VARCHAR(60)
AS 
BEGIN
UPDATE Products
SET PhotosQuantity= @PhotosQuantity
WHERE ProductID = @ProductID
END
;
GO

CREATE PROCEDURE InsertCustomers
@CustomerID VARCHAR(60),
@ZipCode INT,
@City VARCHAR(50),
@State CHAR(2)
AS
BEGIN
INSERT INTO Customers (
CustomerID,
ZipCode,
City,
State
)
VALUES (
@CustomerID,
@ZipCode,
@City,
@State
)
SELECT SCOPE_IDENTITY() AS NewCustomer
END
;
GO

CREATE PROCEDURE RemoveCustomer
@CustomerID VARCHAR(60)
AS
BEGIN 
DELETE FROM Customers
WHERE CustomerID = @CustomerID
END
;
GO

CREATE PROCEDURE InsertSellers
@SellerID VARCHAR(60),
@ZipCode INT,
@City VARCHAR(50),
@State CHAR(2)
AS
BEGIN
INSERT INTO Sellers (
SellerID,
ZipCode,
City,
State
)
VALUES (
@SellerID,
@ZipCode,
@City,
@State
)
SELECT SCOPE_IDENTITY() AS NewSeller
END
;
GO

CREATE PROCEDURE RemoveSeller
@SellerID VARCHAR(60)
AS
BEGIN 
DELETE FROM Sellers
WHERE SellerID = @SellerID
END
;
GO

CREATE PROCEDURE InsertProductCategory
@ProductCategory VARCHAR(70),
@ProductCategoryEnglish VARCHAR(70)
AS
BEGIN
INSERT INTO ProductCategory (
ProductCategory,
ProductCategoryEnglish
)
VALUES (
@ProductCategory,
@ProductCategoryEnglish
)
SELECT SCOPE_IDENTITY() AS NewProductCategory
END
;
GO

CREATE PROCEDURE RemoveProductCategory
@ProductCategory VARCHAR(70)
AS
BEGIN
DELETE FROM ProductCategory
WHERE ProductCategory = @ProductCategory
END
;
GO

CREATE PROCEDURE UpdateProductEnglishTranslation
@ProductCategory VARCHAR(70),
@ProductCategoryEnglish VARCHAR(70)
AS
BEGIN
UPDATE ProductCategory 
SET ProductCategoryEnglish = @ProductCategoryEnglish
WHERE ProductCategory = @ProductCategory
END
;
GO






