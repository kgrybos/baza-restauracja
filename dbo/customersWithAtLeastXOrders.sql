CREATE FUNCTION customersWithAtLeastXOrders(@count int)
RETURNS table
    AS return
    select CustomerId, count(OrderId) as order_count from Orders
    group by CustomerId
    having count(OrderId) >= @count
go

grant select on customersWithAtLeastXOrders to manager
go

