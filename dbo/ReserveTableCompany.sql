CREATE PROCEDURE ReserveTableCompany @CustomerId int, @NumberOfPeople int, @ReservationStart date,
                                        @ReservationEnd date
AS
BEGIN TRY
    BEGIN TRANSACTION 
    IF @NumberOfPeople < 2
        RAISERROR(N'Niewystraczająca liczba uczestników rezerwacji', 16, 1)

    IF (SELECT CompanyId FROM Companies WHERE CustomerId=@CustomerId) IS NULL
        RAISERROR(N'Klient musi być klientem firmowym', 16, 1)

    INSERT INTO Reservation (CustomerId, StartDate, EndDate, IsCompany, numberOfPeople)
    VALUES (@CustomerId, @ReservationStart, @ReservationEnd, 0, @NumberOfPeople)
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
end catch
go

