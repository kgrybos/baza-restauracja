CREATE PROCEDURE CancelReservation @ResId INT
AS
    UPDATE Reservation SET Confirmed = 2 WHERE ReservationId = @ResId
go

