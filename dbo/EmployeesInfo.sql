CREATE VIEW EmployeesInfo AS
SELECT FirstName, LastName, PositionName, Email, Phone, BirthDate, HireDate, Address, PostalCode, City FROM Employees
INNER JOIN Positions P on P.PositionId = Employees.PositionId
go

grant select on EmployeesInfo to manager
go

