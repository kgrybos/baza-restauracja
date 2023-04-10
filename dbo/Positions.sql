create table Positions
(
    PositionId   int identity
        constraint PK_Positions
            primary key,
    PositionName varchar(256) not null,
    ReportsTo    int
        constraint FK_Positions_Positions
            references Positions
)
go

create index PostionIndex
    on Positions (PositionName)
go

