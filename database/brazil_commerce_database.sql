USE [master]
GO
/****** Object:  Database [BrazilCommerceDB]    Script Date: 8/3/2024 9:59:07 PM ******/
CREATE DATABASE [BrazilCommerceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BrazilCommerceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BrazilCommerceDB.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BrazilCommerceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BrazilCommerceDB_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BrazilCommerceDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BrazilCommerceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BrazilCommerceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BrazilCommerceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BrazilCommerceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BrazilCommerceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BrazilCommerceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BrazilCommerceDB] SET  MULTI_USER 
GO
ALTER DATABASE [BrazilCommerceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BrazilCommerceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BrazilCommerceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BrazilCommerceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BrazilCommerceDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BrazilCommerceDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BrazilCommerceDB', N'ON'
GO
ALTER DATABASE [BrazilCommerceDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BrazilCommerceDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BrazilCommerceDB]
GO
/****** Object:  User [leeroy]    Script Date: 8/3/2024 9:59:07 PM ******/
CREATE USER [leeroy] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderID] [varchar](100) NULL,
	[ProductID] [varchar](100) NULL,
	[SellerID] [varchar](100) NULL,
	[ShippingLimitDate] [datetime] NULL,
	[Price] [decimal](10, 2) NULL,
	[FreightValue] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [varchar](100) NOT NULL,
	[CustomerID] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
	[PurchaseTimeStamp] [datetime] NULL,
	[ApprovalTimeStamp] [datetime] NULL,
	[CarrierDeliveryTimeStamp] [datetime] NULL,
	[CustomerDeliveryTimeStamp] [datetime] NULL,
	[EstimatedDeliveryTimeStamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[OrderID] [varchar](100) NULL,
	[Sequential] [int] NULL,
	[Type] [varchar](20) NULL,
	[Installments] [int] NULL,
	[Value] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [varchar](100) NOT NULL,
	[ProductCategory] [varchar](70) NULL,
	[PhotosQuantity] [int] NULL,
	[Weight] [int] NULL,
	[Length] [int] NULL,
	[Height] [int] NULL,
	[Width] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [varchar](100) NULL,
	[OrderID] [varchar](100) NULL,
	[Score] [int] NULL,
	[DateTimeStamp] [datetime] NULL,
	[AnswerTimeStamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[OrderOverviewPerProductCategory]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrderOverviewPerProductCategory] AS 
SELECT 
    p.ProductCategory,
    AVG(r.Score) AS AverageScore,
    SUM(oi.Price) AS TotalRevenue,
    COUNT(o.OrderID) AS OrderCount,
    AVG(py.Installments) AS AverageInstallments,
    (CAST(SUM(CASE
        WHEN o.Status = 'Delivered' 
        THEN 1 
        ELSE 0
    END) AS DECIMAL(10,2)) / COUNT(o.OrderID)) * 100 AS DeliveryRate
FROM 
    Products p
    INNER JOIN OrderItems oi ON p.ProductID = oi.ProductID
    INNER JOIN Payments py ON py.OrderID = oi.OrderID
    INNER JOIN Reviews r ON r.OrderID = oi.OrderID
    INNER JOIN Orders o ON o.OrderID = oi.OrderID
GROUP BY 
    p.ProductCategory;
GO
/****** Object:  View [dbo].[FreightOverviewPerProductCategory]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FreightOverviewPerProductCategory] AS
SELECT 
    p.ProductCategory,
    AVG(oi.FreightValue) AS ShippingCost,
    AVG(DATEDIFF(DAY, o.PurchaseTimeStamp, o.CustomerDeliveryTimeStamp)) AS AverageDeliveryDays,
    CASE 
        WHEN AVG(CASE WHEN o.CustomerDeliveryTimeStamp < o.EstimatedDeliveryTimeStamp THEN 1 ELSE 0 END) > 0.5
        THEN 'OnTime'
        ELSE 'Late'
    END AS AverageDeliveryStatus
FROM 
    OrderItems oi
    INNER JOIN Products p ON oi.ProductID = p.ProductID
    INNER JOIN Orders o ON o.OrderID = oi.OrderID
GROUP BY 
    p.ProductCategory;
GO
/****** Object:  View [dbo].[SellersCountPerProductCategory]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SellersCountPerProductCategory]
AS
SELECT p.ProductCategory,
COUNT(DISTINCT oi.SellerID) AS SellersCount
FROM Products p
INNER JOIN OrderItems oi
ON p.ProductID = oi.ProductID
GROUP BY p.ProductCategory
;
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[SellerID] [varchar](100) NOT NULL,
	[ZipCode] [int] NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SellersCountPerState]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SellersCountPerState]
AS
SELECT State,
COUNT(SellerID) SellersCount
FROM Sellers
GROUP BY State
;
GO
/****** Object:  View [dbo].[OrderOverviewPerState]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrderOverviewPerState]
AS 
SELECT 
	s.State,
	AVG(r.Score) AS AverageScore,
	SUM(oi.Price) AS TotalRevenue,
	COUNT(o.OrderID) AS OrderCount,
	AVG(py.Installments) AS AverageInstallments,
	(CAST(SUM(CASE
		WHEN o.Status = 'Delivered' 
	THEN 1 
	ELSE 0
END) AS DECIMAL(10,2)
)/ COUNT(o.OrderID)) * 100 AS DeliveryRate
FROM Sellers s
INNER JOIN OrderItems oi 
ON s.SellerID = oi.SellerID
INNER JOIN Payments py
ON py.OrderID = oi.OrderID
INNER JOIN Reviews r 
ON r.OrderID = oi.OrderID
INNER JOIN Orders o
ON o.OrderID =oi.OrderID
GROUP BY s.State
;
GO
/****** Object:  View [dbo].[FreightOverviewPerState]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FreightOverviewPerState] AS
SELECT 
    s.State,
    AVG(oi.FreightValue) AS ShippingCost,
    AVG(DATEDIFF(DAY, o.PurchaseTimeStamp, o.CustomerDeliveryTimeStamp)) AS AverageDeliveryDays,
    CASE 
        WHEN AVG(CASE WHEN o.CustomerDeliveryTimeStamp < o.EstimatedDeliveryTimeStamp THEN 1 ELSE 0 END) > 0.5
        THEN 'OnTime'
        ELSE 'Late'
    END AS AverageDeliveryStatus
FROM 
    OrderItems oi
    INNER JOIN Sellers s ON oi.SellerID = s.SellerID
    INNER JOIN Orders o ON o.OrderID = oi.OrderID
GROUP BY 
    s.State;
GO
/****** Object:  View [dbo].[OrderCountByPaymentType]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrderCountByPaymentType]
AS
SELECT Type,
COUNT(Type) TransactionCount
FROM Payments
GROUP BY Type
;
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [varchar](100) NOT NULL,
	[ZipCode] [int] NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetOrderTransitDetails]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetOrderTransitDetails] (@OrderID VARCHAR(60))
RETURNS TABLE
AS 
RETURN
(
SELECT s.City AS CityOrigin,
s.State AS StateOrigin,
c.City AS CityDestination,
c.State AS StateDestination,
o.Status AS DeliveryStatus,
o.EstimatedDeliveryTimeStamp AS DeliveryDateTime,
oi.FreightValue AS ShippingCost
FROM Sellers s
INNER JOIN OrderItems oi
ON s.SellerID = oi.SellerID
INNER JOIN Orders o
ON o.OrderID = oi.OrderID
INNER JOIN Customers c
ON c.CustomerID = o.CustomerID
WHERE o.OrderID = @OrderID
)
;
GO
/****** Object:  UserDefinedFunction [dbo].[GetOrderBillingDetails]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetOrderBillingDetails] (@OrderID VARCHAR(60))
RETURNS TABLE
AS RETURN
(
SELECT p.ProductCategory,
oi.Price ,
oi.FreightValue AS ShippingCost,
py.Type AS PaymentType,
py.Installments AS PaymentInstallmentsCount,
py.Value AS Payment
FROM Products p
INNER JOIN OrderItems oi
ON p.ProductID = oi.ProductID
INNER JOIN Payments py
ON py.OrderID = oi.OrderID
WHERE oi.OrderID = @OrderID
)
;
GO
/****** Object:  Table [dbo].[CustomersAudit]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersAudit](
	[CustomerAuditID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [varchar](100) NULL,
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [date] NULL,
	[OldZipCode] [int] NULL,
	[NewZipCode] [int] NULL,
	[OldCity] [varchar](50) NULL,
	[NewCity] [varchar](50) NULL,
	[OldState] [char](2) NULL,
	[NewState] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Geolocation]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geolocation](
	[ZipCode] [int] NULL,
	[Latitude] [decimal](10, 2) NULL,
	[Longitude] [decimal](10, 2) NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategory] [varchar](70) NOT NULL,
	[ProductCategoryEnglish] [varchar](70) NULL,
 CONSTRAINT [pk_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategoryAudit]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategoryAudit](
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [date] NULL,
	[OldProductCategory] [varchar](70) NULL,
	[NewProductCategory] [varchar](70) NULL,
	[OldProductCategoryEnglish] [varchar](70) NULL,
	[NewProductCategoryEnglish] [varchar](70) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsAudit]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsAudit](
	[ProductAuditID] [varchar](100) NOT NULL,
	[ProductID] [varchar](100) NULL,
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [date] NULL,
	[OldProductCategory] [varchar](70) NULL,
	[NewProductCategory] [varchar](70) NULL,
	[OldPhotosQuantity] [int] NULL,
	[NewPhotosQuantity] [int] NULL,
	[OldWeight] [int] NULL,
	[NewWeight] [int] NULL,
	[OldLength] [int] NULL,
	[NewLength] [int] NULL,
	[OldHeight] [int] NULL,
	[NewHeight] [int] NULL,
	[OldWidth] [int] NULL,
	[NewWidth] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellersAudit]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellersAudit](
	[SellersAuditID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [varchar](100) NULL,
	[ChangeType] [varchar](20) NULL,
	[ChangeDate] [date] NULL,
	[OldZipCode] [int] NULL,
	[NewZipCode] [int] NULL,
	[OldCity] [varchar](50) NULL,
	[NewCity] [varchar](50) NULL,
	[OldState] [char](2) NULL,
	[NewState] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SellersAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempCustomers]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempCustomers](
	[CustomerID] [varchar](100) NULL,
	[CustomerUniqueID] [varchar](100) NULL,
	[ZipCode] [int] NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempOrderItems]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempOrderItems](
	[OrderID] [varchar](100) NULL,
	[OrderItemID] [int] NULL,
	[ProductID] [varchar](100) NULL,
	[SellerID] [varchar](100) NULL,
	[ShippingLimitDate] [datetime] NULL,
	[Price] [decimal](10, 2) NULL,
	[FreightValue] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempProducts]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempProducts](
	[ProductID] [varchar](100) NULL,
	[ProductCategory] [varchar](70) NULL,
	[NameLength] [int] NULL,
	[DescriptionLength] [int] NULL,
	[PhotosQuantity] [int] NULL,
	[Weight] [int] NULL,
	[Length] [int] NULL,
	[Height] [int] NULL,
	[Width] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempReviews]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempReviews](
	[ReviewID] [varchar](100) NULL,
	[OrderID] [varchar](100) NULL,
	[Score] [int] NULL,
	[Title] [varchar](200) NULL,
	[Comment] [varchar](500) NULL,
	[DateTimeStamp] [datetime] NULL,
	[AnswerTimeStamp] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [fk_OrderItems_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [fk_OrderItems_OrderID]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [fk_OrderItems_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [fk_OrderItems_ProductID]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [fk_OrderItems_SellerID] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Sellers] ([SellerID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [fk_OrderItems_SellerID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_Orders_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_Orders_CustomerID]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [fk_Payments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [fk_Payments_OrderID]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [fk_Products_ProductCategoryID] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[ProductCategory] ([ProductCategory])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [fk_Products_ProductCategoryID]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [fk_Reviews_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [fk_Reviews_OrderID]
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomers]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCustomers]
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
/****** Object:  StoredProcedure [dbo].[InsertProductCategory]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertProductCategory]
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
/****** Object:  StoredProcedure [dbo].[InsertProducts]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertProducts]
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
/****** Object:  StoredProcedure [dbo].[InsertSellers]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSellers]
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
/****** Object:  StoredProcedure [dbo].[RemoveCustomer]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveCustomer]
@CustomerID VARCHAR(60)
AS
BEGIN 
DELETE FROM Customers
WHERE CustomerID = @CustomerID
END
;
GO
/****** Object:  StoredProcedure [dbo].[RemoveProduct]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveProduct]
@ProductID VARCHAR(60)
AS
BEGIN 
DELETE FROM Products
WHERE ProductID = @ProductID
END
;
GO
/****** Object:  StoredProcedure [dbo].[RemoveProductCategory]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveProductCategory]
@ProductCategory VARCHAR(70)
AS
BEGIN
DELETE FROM ProductCategory
WHERE ProductCategory = @ProductCategory
END
;
GO
/****** Object:  StoredProcedure [dbo].[RemoveSeller]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveSeller]
@SellerID VARCHAR(60)
AS
BEGIN 
DELETE FROM Sellers
WHERE SellerID = @SellerID
END
;
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductEnglishTranslation]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateProductEnglishTranslation]
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
/****** Object:  StoredProcedure [dbo].[UpdateProductsPhotoQuantity]    Script Date: 8/3/2024 9:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProductsPhotoQuantity]
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
USE [master]
GO
ALTER DATABASE [BrazilCommerceDB] SET  READ_WRITE 
GO
