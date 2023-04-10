CREATE FUNCTION orderValueFromYear(@date Date)
RETURNS money
    AS Begin
        return (select TotalIncome from OrdersStatsYearly where  year(@date) = Year)
end
go

