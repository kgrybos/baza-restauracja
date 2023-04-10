CREATE PROCEDURE ReserveTableIndividual @CustomerId int, @NumberOfPeople int, @ReservationStart date,
    @ReservationEnd date, @Products ProductsTableType READONLY
AS
BEGIN TRY
    BEGIN TRANSACTION
        IF @NumberOfPeople < 2
            RAISERROR(N'Niewystraczająca liczba uczestników rezerwacji', 16, 1)

        IF (SELECT CompanyId FROM Companies WHERE CustomerId=@CustomerId) IS NOT NULL
            RAISERROR(N'Klient musi być klientem indywidualnym', 16, 1)

        IF ISNULL((SELECT OrderCount from CustomersStatsTotal WHERE CustomerId=@CustomerId), 0) < (SELECT TOP 1 MinOrdersCount FROM ReservationRequirements)
            RAISERROR(N'Niewystraczająca liczba zamówień do złożenia rezerwacji', 16, 1)

        DECLARE @ProductsPrice money = dbo.ProductsPrice(@Products)
        IF @ProductsPrice IS NULL
            RAISERROR('Produkt spoza menu', 16, 1)

        IF @ProductsPrice < (SELECT TOP 1 MinSpent FROM ReservationRequirements)
            RAISERROR(N'Niewystraczająca cena produktów', 16, 1)

        INSERT INTO Reservation (CustomerId, StartDate, EndDate, IsCompany, numberOfPeople)
            VALUES (@CustomerId, @ReservationStart, @ReservationEnd, 0, @NumberOfPeople)

        DECLARE @ReservationId int = SCOPE_IDENTITY()

        EXEC AddOrder
            @CustomerId,
            @ReservationId,
            0,
            @ReservationStart,
            @Products
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
end catch
go

