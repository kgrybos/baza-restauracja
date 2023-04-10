CREATE FUNCTION ordersFromDay(@date Date)
RETURNS table AS RETURN
        select * from Orders where  day(OrderDate) = day(@date) and month(OrderDate) = month(@date) and year(OrderDate) = year(@date)
go

grant select on ordersFromDay to normalEmployee
go

