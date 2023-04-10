CREATE PROCEDURE AddIndividualCustomer @Phone varchar(256), @Email varchar(256), @Firstname varchar(256),
    @Lastname varchar(256), @CompanyId int
AS
INSERT INTO Customers (Phone, Email)
VALUES (@Phone, @Email)
INSERT INTO IndividualCustomer (CustomerId, FirstName, LastName, CompanyId)
VALUES (SCOPE_IDENTITY(), @Firstname, @Lastname, @CompanyId)
INSERT INTO CustomerStats (PersonId)
VALUES (SCOPE_IDENTITY())
go

grant execute on AddIndividualCustomer to normalEmployee
go

