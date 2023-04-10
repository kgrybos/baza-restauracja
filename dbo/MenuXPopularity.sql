CREATE FUNCTION MenuXPopularity(@id int)
RETURNS table
    AS return
        select * from MenuPopularity where MenuId = @id
go

grant select on MenuXPopularity to manager
go

