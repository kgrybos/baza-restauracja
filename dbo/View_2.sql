CREATE VIEW dbo.View_2
AS
SELECT dbo.OrderDetails.ProductId, dbo.Products.ProductName, YEAR(dbo.Orders.OrderDate) AS year, DATEPART(week, dbo.Orders.OrderDate) AS week, SUM(dbo.OrderDetails.Quantity) AS SumOfProductsOrdered, 
                  COUNT(dbo.OrderDetails.OrderId) AS CountOfOrders
FROM     dbo.OrderDetails INNER JOIN
                  dbo.Products ON dbo.OrderDetails.ProductId = dbo.Products.ProductId INNER JOIN
                  dbo.Orders ON dbo.OrderDetails.OrderId = dbo.Orders.OrderId
GROUP BY dbo.OrderDetails.ProductId, dbo.Products.ProductName, YEAR(dbo.Orders.OrderDate), DATEPART(week, dbo.Orders.OrderDate)
go

