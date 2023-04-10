CREATE PROCEDURE UpdateCustomerStats @PersonId int, @OrderValue money
AS
    UPDATE CustomerStats
    SET SumOfOrders = SumOfOrders + @OrderValue
    WHERE PersonId=@PersonId

    IF @OrderValue >= (SELECT MinOrderPriceOnce FROM Discounts WHERE EndDate IS NULL)
        UPDATE CustomerStats
        SET CountOfOrders = CountOfOrders + 1
        WHERE PersonId=@PersonId

    IF (SELECT SumOfOrders FROM CustomerStats WHERE PersonId=@PersonId) > (SELECT MinSpentLong FROM Discounts WHERE EndDate IS NULL)
        UPDATE CustomerStats
        SET StartOfDiscount = GETDATE(),
            EndOfDiscount = DATEADD(day, (SELECT DaysActive FROM Discounts WHERE EndDate IS NULL), GETDATE())
        WHERE PersonId=@PersonId
go

