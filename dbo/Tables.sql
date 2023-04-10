create table Tables
(
    TableId    int identity
        constraint PK_Tables
            primary key,
    TableSize  int
        constraint DF_Tables_TableSize default 0 not null
        constraint CH_TableSize
            check ([TableSize] > 0),
    LocationId int                               not null
        constraint FK_Tables_Locations
            references Locations
)
go

create unique index TableId
    on Tables (TableId)
go

