USE BrazilCommerceDB
;
GO

CREATE FUNCTION GetOrderTransitDetails (@OrderID VARCHAR(60))
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

CREATE FUNCTION GetOrderBillingDetails (@OrderID VARCHAR(60))
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