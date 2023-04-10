CREATE FUNCTION employeesWithAtLeastXOrders(@count int)
RETURNS table
    AS return
    select EmployeeId, count(OrderId) as order_count from Orders
    group by EmployeeId
    having count(OrderId) >= @count
go

grant select on employeesWithAtLeastXOrders to manager
go

