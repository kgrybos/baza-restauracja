CREATE PROCEDURE ChangeMenuStatus
AS
    UPDATE MenuHistory SET EndDate=GETDATE() WHERE EndDate IS NULL
go

grant execute on ChangeMenuStatus to manager
go

