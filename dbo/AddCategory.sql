CREATE PROCEDURE AddCategory @CategoryName varchar(256)
AS
    INSERT INTO Categories (CategoryName)
    VALUES (@CategoryName)
go

grant execute on AddCategory to manager
go

