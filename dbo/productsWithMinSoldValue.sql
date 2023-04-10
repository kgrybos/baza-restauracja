CREATE FUNCTION productsWithMinSoldValue(@input int)
RETURNS table AS RETURN
        select OrderDetails.ProductId from OrderDetails
            inner join Products P on OrderDetails.ProductId = P.ProductId
            inner join Menu on P.ProductId = Menu.ProductId
            group by OrderDetails.ProductId
            having Round(sum(Quantity * isnull(Menu.UnitPrice, P.DefaultPrice)),2) > @input
go

grant select on productsWithMinSoldValue to manager
go

