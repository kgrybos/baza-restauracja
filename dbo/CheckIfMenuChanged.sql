CREATE PROCEDURE CheckIfMenuChanged
AS
    DECLARE @CDate date = GETDATE()
    DECLARE @CMenu int = (SELECT TOP 1 MenuId FROM MenuHistory WHERE EndDate IS NULL)
    DECLARE @LMenu int = (SELECT TOP 1 MenuId FROM MenuHistory WHERE EndDate IS NOT NULL ORDER BY EndDate)
    DECLARE @CMenuProducts int = (SELECT COUNT(*)/2 FROM Menu WHERE MenuId = @CMenu)
    DECLARE @CMenuNewProducts int = (SELECT COUNT(*) FROM Menu WHERE MenuId = @CMenu AND MENU.ProductId NOT IN
                                                               (SELECT M.ProductId FROM Menu AS M WHERE M.MenuId = @LMenu))
    IF (@CMenuProducts <= @CMenuNewProducts)
        IF (DATEDIFF(DAY, (SELECT StartDate FROM MenuHistory WHERE MenuId = @CMenu), @CDate)>= 14)
            SELECT 1
        ELSE SELECT 0
    ELSE
        IF (DATEDIFF(DAY, (SELECT StartDate FROM MenuHistory WHERE MenuId = @LMenu), @CDate) >= 14)
            SELECT 1
        ELSE
            SELECT 0
go

