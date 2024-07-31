CREATE DATABASE BrazilCommerceDB
;
GO

USE BrazilCommerceDB
;
GO

CREATE TABLE TempCustomers (
CustomerID VARCHAR(100),
CustomerUniqueID VARCHAR(100),
ZipCode INT,
City VARCHAR(50),
State CHAR(2)
)
;
GO

CREATE TABLE Customers (
CustomerID VARCHAR(100) PRIMARY KEY,
ZipCode INT,
City VARCHAR(50),
State CHAR(2)
)
;
GO

CREATE TABLE Geolocation (
ZipCode INT,
Latitute DECIMAL(10,2),
Longitude DECIMAL(10,2),
City VARCHAR(50),
State CHAR(2)
)
;
GO

CREATE TABLE TempOrderItems (
OrderID VARCHAR(100),
OrderItemID INT,
ProductID VARCHAR(100),
SellerID VARCHAR(100),
ShippingLimitDate DATETIME,
Price DECIMAL(10,2),
FreightValue DECIMAL(10,2)
)
;
GO

CREATE TABLE OrderItems (
OrderID VARCHAR(100),
ProductID VARCHAR(100),
SellerID VARCHAR(100),
ShippingLimitDate DATETIME,
Price DECIMAL(10,2),
FreightValue DECIMAL(10,2)
)
;
GO

CREATE TABLE Orders (
OrderID VARCHAR(100) PRIMARY KEY,
CustomerID VARCHAR(100),
Status VARCHAR(50),
PurchaseTimeStamp DATETIME,
ApprovalTimeStamp DATETIME,
CarrierDeliveryTimeStamp DATETIME,
CustomerDeliveryTimeStamp DATETIME,
EstimatedDeliveryTimeStamp DATETIME
)
;
GO

CREATE TABLE Payments (
OrderID VARCHAR(100),
Sequential INT,
Type VARCHAR(20),
Installments INT,
Value DECIMAL(10,2)
)
;
GO

CREATE TABLE ProductCategory (
ProductCategory VARCHAR(70),
ProductCategoryEnglish VARCHAR(70)
)
;
GO

CREATE TABLE TempProducts (
ProductID VARCHAR(100),
ProductCategory VARCHAR(70),
NameLength INT,
DescriptionLength INT,
PhotosQuantity INT,
Weight INT,
Length INT,
Height INT,
Width INT
)
;
GO

CREATE TABLE Products (
ProductID VARCHAR(100) PRIMARY KEY,
ProductCategory VARCHAR(70),
PhotosQuantity INT,
Weight INT,
Length INT,
Height INT,
Width INT
)
;
GO 

CREATE TABLE TempReviews (
ReviewID VARCHAR(100),
OrderID VARCHAR(100),
Score INT,
Title VARCHAR(200),
Comment VARCHAR(500),
DateTimeStamp DATETIME,
AnswerTimeStamp DATETIME
)
;
GO

CREATE TABLE Reviews (
ReviewID VARCHAR(100),
OrderID VARCHAR(100),
Score INT,
DateTimeStamp DATETIME,
AnswerTimeStamp DATETIME
)
;
GO

CREATE TABLE Sellers (
SellerID VARCHAR(100) PRIMARY KEY,
ZipCode INT,
City VARCHAR(50),
State CHAR(2)
)
;
GO

CREATE TABLE OrderItemsAudit (
OrderID VARCHAR(100),
ProductID VARCHAR(100),
SellerID VARCHAR(100),
ChangeType VARCHAR(20),
ChangeDate DATETIME,
OldShippingLimitDate DATETIME,
NewShippingLimitDate DATETIME,
OldPrice DECIMAL(10,2),
NewPrice DECIMAL(10,2),
OldFreightValue DECIMAL(10,2),
NewFreightValue DECIMAL(10,2)
)
;
GO

CREATE TABLE OrdersAudit (
OrderAuditID INT IDENTITY (1,1) PRIMARY KEY,
OrderID VARCHAR(100),
CustomerID VARCHAR(100),
ChangeType VARCHAR(20),
ChangeDate DATETIME,
OldStatus VARCHAR(50),
NewStatus VARCHAR(50),
OldPurchaseTimeStamp DATETIME,
NewPurchaseTimeStamp DATETIME,
OldApprovalTimeStamp DATETIME,
NewApprovalTimeStamp DATETIME,
OldCarrierDeliveryTimeStamp DATETIME,
NewCarrierDeliveryTimeStamp DATETIME,
OldCustomerDeliveryTimeStamp DATETIME,
NewCustomerDeliveryTimeStamp DATETIME,
OldEstimatedDeliveryTimeStamp DATETIME,
NewEstimatedDeliveryTimeStamp DATETIME
)
;
GO

CREATE TABLE PaymentsAudit (
PaymentAuditID INT IDENTITY(1,1) PRIMARY KEY,
OrderID VARCHAR(100),
ChangeType VARCHAR(20),
ChangeDate DATETIME,
OldSequential INT,
NewSequential INT,
OldType VARCHAR(20),
NewType VARCHAR(20),
OldInstallments INT,
NewInstallments INT,
OldValue DECIMAL(10,2),
NewValue DECIMAL(10,2)
)
;
GO

















