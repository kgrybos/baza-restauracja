CREATE PROCEDURE CreateNewMenu @ProductIds varchar(256), @UnitPrices varchar(256)
AS
--     EXEC ChangeMenuStatus
--     INSERT INTO MenuHistory (StartDate, EndDate) VALUES (GETDATE(), null)
    SELECT prods.value, costs.value FROM STRING_SPLIT(@UnitPrices, ',') AS costs, STRING_SPLIT(@ProductIds, ',') AS prods
        LEFT JOIN STRING_SPLIT(@ProductIds, ',') as helper ON helper.value != prods.value
go

