CREATE FUNCTION DiscountXInfo(@id int)
RETURNS table
    AS return
        select Round(isNUll(sum(DiscountAmount), 0),2) as discount_amoutn from OrderDetails
    where DiscountId = @id
go

grant select on DiscountXInfo to manager
go

grant select on DiscountXInfo to normalEmployee
go

