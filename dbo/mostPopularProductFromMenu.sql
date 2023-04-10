CREATE FUNCTION mostPopularProductFromMenu(@menu int)
RETURNS table
    AS return
    select count(OrderId) as product_count, ProductId from OrderDetails
    where MenuId = @menu
    group by ProductId
    having count(OrderId) >= (Select TOP 1 count(ORderId) from OrderDetails WHERE MenuId = @menu group by ProductId)
go

grant select on mostPopularProductFromMenu to manager
go

grant select on mostPopularProductFromMenu to normalEmployee
go

