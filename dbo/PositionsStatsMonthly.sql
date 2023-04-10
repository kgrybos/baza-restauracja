CREATE VIEW PositionsStatsMonthly AS
SELECT Pos.PositionName, DATEPART(YEAR, O.OrderDate) AS Year, DATEPART(MONTH, O.OrderDate) AS Month, COUNT(DISTINCT O.OrderId) AS NumberOfOrders, SUM((OD.Quantity * ISNULL(M.UnitPrice, P.DefaultPrice))
    * (1 - OD.DiscountAmount)) AS TotalIncome, SUM(OD.Quantity) AS NumberOfProductsSold FROM Positions Pos
INNER JOIN Employees E on Pos.PositionId = E.PositionId
INNER JOIN Orders O ON E.EmployeeId = O.EmployeeId
INNER JOIN OrderDetails OD on O.OrderId = OD.OrderId
INNER JOIN Products P on P.ProductId = OD.ProductId
INNER JOIN Menu M on OD.MenuId = M.MenuId AND OD.ProductId = M.ProductId
GROUP BY Pos.PositionName, DATEPART(YEAR, O.OrderDate), DATEPART(MONTH, O.OrderDate)
go

grant select on PositionsStatsMonthly to manager
go

