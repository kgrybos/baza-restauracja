CREATE FUNCTION productsWithAtLeastXOrders(@productCount int)
RETURNS table AS RETURN
        select ProductId from OrderDetails
            group by ProductId
            having count(ProductId) >= @productCount
go

grant select on productsWithAtLeastXOrders to manager
go

