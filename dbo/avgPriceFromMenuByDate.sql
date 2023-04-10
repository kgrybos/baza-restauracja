CREATE FUNCTION avgPriceFromMenuByDate(@date Date)
RETURNS table
    AS return
    select Round(AVG(ISNULL(UnitPrice, DefaultPrice)),2) as avg_price from Menu
    inner join Products P on Menu.ProductId = P.ProductId
    where menuId in (
        select menuId from MenuHistory where @date between StartDate and isnull(EndDate, GETDATE())
        )
    group by MenuId
go

grant select on avgPriceFromMenuByDate to manager
go

