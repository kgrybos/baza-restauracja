CREATE PROCEDURE AddConfirmedOrder @CustomerId int, @ReservationId int, @IsTakeAway tinyint, @RealiseDate date,
                       @Products ProductsTableType READONLY
AS
    BEGIN TRY
        BEGIN TRANSACTION
        EXEC AddOrder @CustomerId, @ReservationId, @IsTakeAway,
            @RealiseDate,@Products

        DECLARE @PersonId int = (SELECT PersonId FROM IndividualCustomer WHERE CustomerId=@CustomerId)
        DECLARE @ProductsPrice money = dbo.ProductsPrice(@Products)

        IF @PersonId IS NOT NULL
        BEGIN
            EXEC UpdateCustomerStats @PersonId, @ProductsPrice
        END
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    end catch
go

