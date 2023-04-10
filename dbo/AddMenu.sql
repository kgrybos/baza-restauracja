CREATE PROCEDURE AddMenu @Products MenuProducts READONLY
AS
    EXEC ChangeMenuStatus
    INSERT INTO MenuHistory (StartDate, EndDate) VALUES (GETDATE(), null)
    DECLARE @MenuId int = SCOPE_IDENTITY()

    DECLARE @ProductId int, @Price money

    DECLARE cur CURSOR LOCAL FAST_FORWARD FOR
        SELECT ProductId, Price
        FROM @Products;

    OPEN cur;
    FETCH NEXT FROM cur INTO @ProductId, @Price;
    WHILE @@FETCH_STATUS = 0
        BEGIN
            INSERT INTO Menu (MenuId, ProductId, UnitPrice) VALUES (@MenuId, @ProductId, @Price)
            FETCH NEXT FROM cur INTO @ProductId, @Price;
        END;
    CLOSE cur;
    DEALLOCATE cur;
go

grant execute on AddMenu to manager
go

