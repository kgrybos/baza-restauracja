CREATE PROCEDURE AddEmployee @LastName varchar(256), @FirstName varchar(256), @PositionId int, @Birthdate date,
@Hiredate date, @Address varchar(256), @City varchar(256), @Region varchar(256), @PostalCode varchar(256),
@Phone varchar(256), @Mail varchar(256), @Photo varchar(1024)
AS
    INSERT INTO Employees (LastName, FirstName, PositionId, BirthDate, HireDate, Address, City, Region,
                           PostalCode, Phone, Email, Photo)
    VALUES (@LastName, @FirstName, @PositionId, @Birthdate, @Hiredate, @Address, @City, @Region, @PostalCode,
            @Phone, @Mail, @Photo)
go

