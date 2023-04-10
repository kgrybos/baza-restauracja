CREATE FUNCTION orderValueFromMonth(@date Date)
RETURNS money
    AS Begin
        return (select TotalIncome from OrdersStatsMonthly where month(@date) = Month and year(@date) = Year)
end
go

