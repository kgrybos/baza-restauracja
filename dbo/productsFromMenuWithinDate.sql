CREATE FUNCTION productsFromMenuWithinDate(@date date)
RETURNS table AS RETURN
        select Menu.ProductId from MenuHistory
        inner join Menu on  MenuHistory.MenuId = Menu.MenuId
        where @date between StartDate and isnull(EndDate, GETDATE())
go

grant select on productsFromMenuWithinDate to normalEmployee
go

