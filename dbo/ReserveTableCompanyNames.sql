CREATE PROCEDURE ReserveTableCompanyNames @CustomerId int, @People Persons READONLY, @ReservationStart date,
                                        @ReservationEnd date
AS
BEGIN TRY
    BEGIN TRANSACTION
    DECLARE @NumberOfPeople int = (SELECT Count(PersonId) FROM @People)
    IF @NumberOfPeople < 2
        RAISERROR(N'Niewystraczająca liczba uczestników rezerwacji', 16, 1)

    IF (SELECT CompanyId FROM Companies WHERE CustomerId=@CustomerId) IS NULL
        RAISERROR(N'Klient musi być klientem firmowym', 16, 1)

    INSERT INTO Reservation (CustomerId, StartDate, EndDate, IsCompany, numberOfPeople)
    VALUES (@CustomerId, @ReservationStart, @ReservationEnd, 0, @NumberOfPeople)

    DECLARE @ReservationId int = SCOPE_IDENTITY()

    DECLARE @PersonId int

    DECLARE cur CURSOR LOCAL FAST_FORWARD FOR
        SELECT PersonId
        FROM @People;

    OPEN cur;
    FETCH NEXT FROM cur INTO @PersonId;
    WHILE @@FETCH_STATUS = 0
        BEGIN
            INSERT INTO ReservationParticipants (ReservationId, PersonId)
            VALUES (@ReservationId, @PersonId)
            FETCH NEXT FROM cur INTO @PersonId;
        END;
    CLOSE cur;
    DEALLOCATE cur;
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
end catch
go

