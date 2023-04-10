CREATE FUNCTION employeesWithAtLeastXOrderValue(@count int)
RETURNS table
    AS return
    select EmployeeId from EmployeeStatsTotal
    inner join Employees on Employees.FirstName = EmployeeStatsTotal.FirstName and EmployeeStatsTotal.LastName = Employees.LastName
    where TotalIncome >= @count
go

grant select on employeesWithAtLeastXOrderValue to manager
go

