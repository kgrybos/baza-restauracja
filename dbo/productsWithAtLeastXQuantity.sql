CREATE FUNCTION productsWithAtLeastXQuantity(@productCount int)
RETURNS table AS RETURN
        select ProductId from OrderDetails
            group by ProductId
            having sum(Quantity) >= @productCount
go

grant select on productsWithAtLeastXQuantity to manager
go

