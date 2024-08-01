USE BrazilCommerceDB
;
GO

CREATE TRIGGER TrgAfterInsertCustomer
ON Customers
AFTER INSERT
AS
BEGIN
INSERT INTO CustomersAudit (
CustomerID,
ChangeType,
ChangeDate,
NewZipCode,
NewCity,
NewState
)
SELECT
i.CustomerID,
'INSERT',
GETDATE(),
i.ZipCode,
i.City,
i.State
FROM inserted i
END
;
GO

CREATE TRIGGER TrgAfterDeleteCustomer
ON Customers
AFTER DELETE
AS
BEGIN
INSERT INTO CustomersAudit (
CustomerID,
ChangeType,
ChangeDate,
OldZipCode,
OldCity,
OldState
)
SELECT
d.CustomerID,
'DELETE',
GETDATE(),
d.ZipCode,
d.City,
d.State
FROM deleted d
END
;
GO

CREATE TRIGGER AfterUpdateCustomer 
ON Customers
AFTER UPDATE
AS
BEGIN
INSERT INTO CustomersAudit (
CustomerID,
ChangeType,
ChangeDate,
OldZipCode,
NewZipCode,
OldCity,
NewCity,
OldState,
NewState
)
SELECT 
d.CustomerID,
'UPDATE',
GETDATE(),
d.ZipCode,
i.ZipCode,
d.City,
i.City,
d.State,
i.State
FROM deleted d 
INNER JOIN inserted i
ON d.CustomerID = i.CustomerID
END
;
GO

CREATE TRIGGER TrgAfterInsertSeller
ON Sellers
AFTER INSERT
AS
BEGIN
INSERT INTO SellersAudit (
SellerID,
ChangeType,
ChangeDate,
NewZipCode,
NewCity,
NewState
)
SELECT
i.SellerID,
'INSERT',
GETDATE(),
i.ZipCode,
i.City,
i.State
FROM inserted i
END
;
GO

CREATE TRIGGER TrgAfterDeleteSellers
ON Sellers
AFTER DELETE
AS
BEGIN
INSERT INTO SellersAudit (
SellerID,
ChangeType,
ChangeDate,
OldZipCode,
OldCity,
OldState
)
SELECT
d.SellerID,
'DELETE',
GETDATE(),
d.ZipCode,
d.City,
d.State
FROM deleted d
END
;
GO

CREATE TRIGGER AfterUpdateSeller
ON Sellers
AFTER UPDATE
AS
BEGIN
INSERT INTO SellersAudit (
SellerID,
ChangeType,
ChangeDate,
OldZipCode,
NewZipCode,
OldCity,
NewCity,
OldState,
NewState
)
SELECT 
d.SellerID,
'UPDATE',
GETDATE(),
d.ZipCode,
i.ZipCode,
d.City,
i.City,
d.State,
i.State
FROM deleted d 
INNER JOIN inserted i
ON d.SellerID = i.SellerID
END
;
GO

CREATE TRIGGER TrgInsertProduct
ON Products
AFTER INSERT
AS 
BEGIN
INSERT INTO ProductsAudit (
ProductID,
ChangeType,
ChangeDate,
NewProductCategory,
NewPhotosQuantity,
NewWeight,
NewLength,
NewHeight,
NewWidth
)
SELECT
i.ProductID,
'INSERT',
GETDATE(),
i.ProductCategory,
i.PhotosQuantity,
i.Weight,
i.Length,
i.Height,
i.Width
FROM inserted i
END
;
GO

CREATE TRIGGER TrgDeleteProduct
ON Products
AFTER DELETE
AS 
BEGIN
INSERT INTO ProductsAudit (
ProductID,
ChangeType,
ChangeDate,
OldProductCategory,
OldPhotosQuantity,
OldWeight,
OldLength,
OldHeight,
OldWidth
)
SELECT
d.ProductID,
'DELETE',
GETDATE(),
d.ProductCategory,
d.PhotosQuantity,
d.Weight,
d.Length,
d.Height,
d.Width
FROM deleted d
END
;
GO

CREATE TRIGGER TrgAfterUpdateProduct
ON Products
AFTER UPDATE
AS 
BEGIN
INSERT INTO ProductsAudit (
ProductID,
ChangeType,
ChangeDate,
OldProductCategory,
NewProductCategory,
OldPhotosQuantity,
NewPhotosQuantity,
OldWeight,
NewWeight,
OldLength,
NewLength,
OldHeight,
NewHeight,
OldWidth,
NewWidth
)
SELECT  
d.ProductID,
'UPDATE',
GETDATE(),
d.ProductCategory,
i.ProductCategory,
d.PhotosQuantity,
i.PhotosQuantity,
d.Weight,
i.Weight,
d.Length,
i.Length,
d.Height,
i.Height,
d.Width,
i.Width
FROM deleted d
INNER JOIN inserted i
ON d.ProductID = i.ProductID
END
;
GO

CREATE TRIGGER TrgAfterInsertProductCategory
ON ProductCategory
AFTER INSERT
AS
BEGIN
INSERT INTO ProductCategoryAudit (
ChangeType,
ChangeDate,
NewProductCategory,
NewProductCategoryEnglish 
)
SELECT 
'INSERT',
GETDATE(),
i.ProductCategory,
i.ProductCategoryEnglish 
FROM inserted i
END
;
GO

CREATE TRIGGER TrgAfterDeleteProductCategory
ON ProductCategory
AFTER DELETE
AS
BEGIN
INSERT INTO ProductCategoryAudit (
ChangeType,
ChangeDate,
OldProductCategory,
OldProductCategoryEnglish 
)
SELECT 
'DELETE',
GETDATE(),
d.ProductCategory,
d.ProductCategoryEnglish 
FROM deleted d
END
;
GO

CREATE TRIGGER TrgAfterUpdateProductCategory
ON ProductCategory
AFTER UPDATE
AS
BEGIN
Insert INTO ProductCategoryAudit (
ChangeType,
ChangeDate,
OldProductCategory,
NewProductCategory,
OldProductCategoryEnglish,
NewProductCategoryEnglish
)
SELECT 
'UPDATE',
GETDATE(),
d.ProductCategory,
i.ProductCategory,
d.ProductCategoryEnglish,
i.ProductCategoryEnglish
FROM deleted d 
INNER JOIN inserted i
ON d.ProductCategory = i.ProductCategory
END
;
GO

