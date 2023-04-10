CREATE PROCEDURE AddTable @TableSize int, @LocationId int
AS
    INSERT INTO Tables (TableSize, LocationId) VALUES (@TableSize, @LocationId)
go

