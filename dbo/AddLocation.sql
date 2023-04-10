CREATE PROCEDURE AddLocation @LocationName  varchar(256), @LocationDesc varchar(256)
AS
    INSERT INTO Locations (LocationName, LocationDescription) VALUES (@LocationName, @LocationDesc)
go

grant execute on AddLocation to manager
go

