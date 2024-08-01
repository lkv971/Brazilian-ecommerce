USE BrazilCommerceDB
;
GO

ALTER TABLE ProductCategory
ALTER COLUMN ProductCategory VARCHAR(70) NOT NULL
;
GO

ALTER TABLE ProductCategory
ADD CONSTRAINT pk_ProductCategory
PRIMARY KEY (ProductCategory)
;
GO

EXEC sp_rename 'Geolocation.Latitute',
'Latitude', 'COLUMN'
;
GO

ALTER TABLE OrderItems
ADD CONSTRAINT fk_OrderItems_OrderID
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID)
;
GO

ALTER TABLE OrderItems
ADD CONSTRAINT fk_OrderItems_ProductID
FOREIGN KEY (ProductID)
REFERENCES Products(ProductID)
;
GO

ALTER TABLE OrderItems
ADD CONSTRAINT fk_OrderItems_SellerID
FOREIGN KEY (SellerID)
REFERENCES Sellers(SellerID)
;
GO

ALTER TABLE Orders
ADD CONSTRAINT fk_Orders_CustomerID
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
;
GO

ALTER TABLE Payments
ADD CONSTRAINT fk_Payments_OrderID
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID)
;
GO

ALTER TABLE Reviews
ADD CONSTRAINT fk_Reviews_OrderID
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID)
;
GO





