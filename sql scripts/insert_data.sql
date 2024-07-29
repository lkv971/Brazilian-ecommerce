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

