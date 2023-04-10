CREATE PROCEDURE ChangeEmployeePosition @EmployeeId int, @NewPositionId int
AS
    UPDATE Employees SET PositionId = @NewPositionId WHERE EmployeeId = @EmployeeId
go

