CREATE PROCEDURE AddOrder @CustomerId int, @ReservationId int, @IsTakeAway tinyint, @RealiseDate date,
    @Products ProductsTableType READONLY 
AS
    DECLARE @PersonId int = (SELECT PersonId FROM IndividualCustomer WHERE CustomerId=@CustomerId)
    DECLARE @OrderDate date = getdate()

    DECLARE @DiscountType int
    IF @PersonId IS NOT NULL
        BEGIN
            IF (SELECT PersonId FROM CustomerStats WHERE @OrderDate BETWEEN StartOfDiscount AND EndOfDiscount AND PersonId=@PersonId) IS NOT NULL
                SET @DiscountType = 1
            ELSE IF (SELECT CountOfOrders FROM CustomerStats WHERE PersonId=@PersonId) >= (SELECT MinOrderCountOnce FROM Discounts WHERE EndDate IS NULL)
                SET @DiscountType = 0
        END

    DECLARE @DiscountId int
    IF @DiscountType IS NULL
        SET @DiscountId = null
    ELSE
        SET @DiscountId = (SELECT DiscountId FROM Discounts WHERE EndDate IS NULL)

    DECLARE @DiscountPercent float = 0
    IF @DiscountType = 0
        SET @DiscountPercent = (SELECT PercentageOnce FROM Discounts WHERE DiscountId = @DiscountId)
    ELSE IF @DiscountType = 1
        SET @DiscountPercent = (SELECT PercentageLong FROM Discounts WHERE DiscountId = @DiscountId)

    INSERT INTO Orders (CustomerId, EmployeeId, OrderDate, RealiseDate, ReservationId, IsTakeAway)
    VALUES (@CustomerId, null, @OrderDate, @RealiseDate, @ReservationId, @IsTakeAway)

    DECLARE @OrderId int = SCOPE_IDENTITY()
    DECLARE @MenuId int = (SELECT MenuId FROM MenuHistory WHERE EndDate IS NULL)

    DECLARE
        @ProductId int,
        @Quantity int;

    DECLARE ProductCursor CURSOR LOCAL FAST_FORWARD FOR
        SELECT ProductId, Quantity
        FROM @Products;

    DECLARE @OrderValue money = 0

    OPEN ProductCursor;
    FETCH NEXT FROM ProductCursor INTO @ProductId, @Quantity;
    WHILE @@FETCH_STATUS = 0
        BEGIN
            DECLARE @ProductPrice money = dbo.ProductPrice(@ProductId, @Quantity)
            IF @ProductPrice IS NULL
                RAISERROR('Produkt spoza menu', 16, 1)

            DECLARE @DiscountAmount money = @ProductPrice*@DiscountPercent
            SET @OrderValue = @OrderValue + @ProductPrice-@DiscountAmount
            INSERT INTO OrderDetails (OrderId, ProductId, Quantity, DiscountId, MenuId, DiscountType, DiscountAmount)
                VALUES (@OrderId, @ProductId, @Quantity, @DiscountId, @MenuId, @DiscountType, @DiscountAmount)
            FETCH NEXT FROM ProductCursor INTO @ProductId, @Quantity;
        END;
    CLOSE ProductCursor;
    DEALLOCATE ProductCursor;
go

grant execute on AddOrder to normalEmployee
go

