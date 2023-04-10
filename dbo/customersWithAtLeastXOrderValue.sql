CREATE FUNCTION customersWithAtLeastXOrderValue(@count int)
RETURNS table
    AS return
    select CustomerId from CustomersStatsTotal
    where totalPrice >= @count
go

grant select on customersWithAtLeastXOrderValue to manager
go

