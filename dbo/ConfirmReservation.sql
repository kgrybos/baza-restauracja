CREATE PROCEDURE ConfirmReservation @ReservationId int, @TableId int, @Confirmed tinyint
AS
    UPDATE Reservation SET Confirmed = @Confirmed WHERE ReservationId = @ReservationId
    IF @Confirmed=1
        INSERT INTO ReservationDetails VALUES (@ReservationId, @TableId)

        DECLARE @PersonId int = (SELECT IC.PersonId FROM IndividualCustomer IC
                                                   INNER JOIN Reservation R on R.CustomerId = IC.CustomerId
                                 WHERE R.ReservationId=@ReservationId)
        DECLARE @ProductsPrice money = (SELECT order_value FROM dbo.orderValue(
            (SELECT OrderId FROM Orders WHERE ReservationId=@ReservationId)
            ))
        if @PersonId IS NOT NULL
            EXEC UpdateCustomerStats @PersonId, @ProductsPrice
go

grant execute on ConfirmReservation to normalEmployee
go

