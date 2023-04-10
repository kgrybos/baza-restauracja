CREATE FUNCTION CompanyXEmployees(@id int)
RETURNS table
    AS return
        select * from IndividualCustomer where CompanyId = @id
go

