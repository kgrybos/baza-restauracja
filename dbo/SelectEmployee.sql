CREATE PROCEDURE SelectEmployee @OrderId int, @EmployeeId int
AS
UPDATE Orders SET EmployeeId=@EmployeeId WHERE OrderId = @OrderId
go

