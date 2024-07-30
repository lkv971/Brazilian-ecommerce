USE BrazilCommerceDB
;
GO

CREATE VIEW OrderOverviewPerProductCategory AS 
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
    INNER JOIN OrderItems oi
	ON p.ProductID = oi.ProductID
    INNER JOIN Payments py
	ON py.OrderID = oi.OrderID
    INNER JOIN Reviews r
	ON r.OrderID = oi.OrderID
    INNER JOIN Orders o
	ON o.OrderID = oi.OrderID
GROUP BY 
    p.ProductCategory;
GO


CREATE VIEW FreightOverviewPerProductCategory AS
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


CREATE VIEW SellersCountPerProductCategory
AS
SELECT p.ProductCategory,
COUNT(DISTINCT oi.SellerID) AS SellersCount
FROM Products p
INNER JOIN OrderItems oi
ON p.ProductID = oi.ProductID
GROUP BY p.ProductCategory
;
GO

CREATE VIEW SellersCountPerState
AS
SELECT State,
COUNT(SellerID) SellersCount
FROM Sellers
GROUP BY State
;
GO

CREATE VIEW OrderOverviewPerState
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

CREATE VIEW FreightOverviewPerState AS
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


CREATE VIEW OrderCountByPaymentType
AS
SELECT Type,
COUNT(Type) TransactionCount
FROM Payments
GROUP BY Type
;
GO




