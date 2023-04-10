CREATE FUNCTION productsFromMenu(@input int)
RETURNS table AS RETURN
        select ProductId from Menu where MenuId = @input
go

grant select on productsFromMenu to normalEmployee
go

