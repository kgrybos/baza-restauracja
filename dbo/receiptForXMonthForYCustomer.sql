CREATE FUNCTION receiptForXMonthForYCustomer(@date Date, @clientId int)
RETURNS table
    AS return
        select CustomerId, OrderDate,  Round(sum(Quantity * isnull(UnitPrice, DefaultPrice) - DiscountAmount)  ,2) as menu_value from Orders
         inner join OrderDetails OD on Orders.OrderId = OD.OrderId
         inner join Products P on OD.ProductId = P.ProductId
         inner join Menu M on P.ProductId = M.ProductId
         where month(@date) = month(OrderDate) and year(OrderDate) = year(@date) and @clientId = 2
        group by CustomerId, OrderDate
go

grant select on receiptForXMonthForYCustomer to normalEmployee
go

