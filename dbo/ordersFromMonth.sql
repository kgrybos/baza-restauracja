CREATE FUNCTION ordersFromMonth(@date Date)
RETURNS table AS RETURN
        select * from Orders where month(OrderDate) = month(@date) and year(OrderDate) = year(@date)
go

grant select on ordersFromMonth to normalEmployee
go

