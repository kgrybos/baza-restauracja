CREATE VIEW CurrentMenu AS
SELECT ProductName, UnitPrice FROM Products
JOIN Menu M on Products.ProductId = M.ProductId
JOIN MenuHistory MH on MH.MenuId = M.MenuId
WHERE MH.EndDate IS NULL OR MH.EndDate >= GETDATE()
go

grant select on CurrentMenu to normalEmployee
go

