CREATE FUNCTION avgPriceFromMenu(@menu int)
RETURNS table
    AS return
    select Round(AVG(ISNULL(UnitPrice, DefaultPrice)),2) as avg_price from Menu
    inner join Products P on Menu.ProductId = P.ProductId
    where @menu = MenuId
    group by MenuId
go

grant select on avgPriceFromMenu to manager
go

