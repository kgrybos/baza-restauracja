CREATE FUNCTION orderValue(@id int)
RETURNS table
   AS return
       select od.OrderId, Round(sum(Quantity * isnull(UnitPrice, DefaultPrice) - DiscountAmount)  ,2) as order_value from OrderDetails od
       inner join Products P on od.ProductId = P.ProductId
       inner join Menu M on P.ProductId = M.ProductId
       where od.OrderId = @id
       group by od.OrderId
go

