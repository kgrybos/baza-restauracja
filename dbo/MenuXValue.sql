CREATE FUNCTION MenuXValue(@id int)
RETURNS table
    AS return
        select od.MenuId, Round(sum(Quantity * isnull(UnitPrice, DefaultPrice) - DiscountAmount)  ,2) as menu_value from OrderDetails od
        inner join Products P on od.ProductId = P.ProductId
        inner join Menu M on P.ProductId = M.ProductId
        where M.MenuId = @id
        group by od.MenuId
go

grant select on MenuXValue to manager
go

