USE BrazilCommerceDB
;
GO

BULK INSERT TempCustomers
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\customers.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT =  'CSV'
)
;
GO

INSERT INTO Customers (
CustomerID,
ZipCode,
City,
State
)
SELECT CustomerID,
ZipCode,
City,
State
FROM TempCustomers
;
GO

BULK INSERT Geolocation
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\geolocation.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT =  'CSV'
)
;
GO

BULK INSERT TempOrderItems
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\order_items.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT =  'CSV'
)
;
GO

INSERT INTO OrderItems (
OrderID,
ProductID,
SellerID,
ShippingLimitDate,
Price,
FreightValue
)
SELECT OrderID,
ProductID,
SellerID,
ShippingLimitDate,
Price,
FreightValue
FROM TempOrderItems
;
GO


BULK INSERT Orders
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\orders.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT =  'CSV'
)
;
GO

BULK INSERT Payments
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\payments.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT =  'CSV'
)
;
GO

BULK INSERT ProductCategory
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\product_category.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT =  'CSV'
)
;
GO

BULK INSERT TempProducts
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\products.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a',
TABLOCK,
FORMAT =  'CSV'
)
;
GO

INSERT INTO Products (
ProductID,
ProductCategory,
PhotosQuantity,
Weight,
Length,
Height,
Width
)
SELECT ProductID,
ProductCategory,
PhotosQuantity,
Weight,
Length,
Height,
Width
FROM TempProducts
;
GO


BULK INSERT TempReviews
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\reviews.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT =  'CSV'
)
;
GO

INSERT INTO Reviews (
ReviewID,
OrderID,
Score,
DateTimeStamp,
AnswerTimeStamp
)
SELECT ReviewID,
OrderID,
Score,
DateTimeStamp,
AnswerTimeStamp
FROM TempReviews
;
GO


BULK INSERT Sellers
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\sellers.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK,
FORMAT =  'CSV'
)
;
GO

EXEC InsertProductCategory
@ProductCategory = 'nao categorizado',
@ProductCategoryEnglish = 'not categorized'
;
GO

EXEC RemoveProductCategory
@ProductCategory = 'nao categorizado'
;
GO

EXEC InsertProductCategory
@ProductCategory = 'nao_categorizado',
@ProductCategoryEnglish = 'not_categorized'
;
GO