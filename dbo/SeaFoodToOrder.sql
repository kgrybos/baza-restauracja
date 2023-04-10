CREATE view dbo.SeaFoodToOrder as
select ProductName, SUM(Quantity) as SumOfQuantity from Orders
inner join OrderDetails OD on Orders.OrderId = OD.OrderId
inner join Products P on OD.ProductId = P.ProductId
inner join Categories C on P.CategoryId = C.CategoryId
inner join Reservation R2 on R2.ReservationId = Orders.ReservationId
    where CategoryName='Owoce Morza' AND R2.StartDate>=getdate() AND R2.EndDate<dateadd(week, 1, getdate())
group by ProductName
go

