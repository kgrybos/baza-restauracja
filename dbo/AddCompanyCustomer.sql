CREATE PROCEDURE AddCompanyCustomer @Phone varchar(256), @Email varchar(256), @CompanyName varchar(256),
    @NIP varchar(256), @Address varchar(256), @Region varchar(256), @City varchar(256), @PostalCode  varchar(256)
AS
INSERT INTO Customers (Phone, Email)
VALUES (@Phone, @Email)
INSERT INTO Companies (CustomerId, CompanyName, NIP, Address, Region, City, PostalCode)
VALUES (SCOPE_IDENTITY(), @CompanyName, @NIP, @Address, @Region, @City, @PostalCode)
go

grant execute on AddCompanyCustomer to normalEmployee
go

