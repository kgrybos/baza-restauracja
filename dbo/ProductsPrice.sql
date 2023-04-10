CREATE FUNCTION ProductsPrice(@Products ProductsTableType READONLY)
    RETURNS money
AS
BEGIN
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
                RETURN NULL
            SET @OrderValue = @OrderValue + @ProductPrice
            FETCH NEXT FROM ProductCursor INTO @ProductId, @Quantity;
        END;
    CLOSE ProductCursor;
    DEALLOCATE ProductCursor;

    RETURN @OrderValue
END
go

