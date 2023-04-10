CREATE FUNCTION ProductPrice(@ProductId int, @Quantity int)
RETURNS money
AS
BEGIN
    RETURN (SELECT ROUND(@Quantity * Menu.UnitPrice, 2)
        FROM     Products INNER JOIN
                 Menu ON Products.ProductId = Menu.ProductId
        WHERE Products.ProductId=@ProductId AND Menu.MenuId = (SELECT MenuId FROM MenuHistory WHERE EndDate IS NULL))
END
go

