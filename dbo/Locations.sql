create table Locations
(
    LocationId          int identity
        constraint PK_Locations
            primary key,
    LocationName        varchar(256) not null,
    LocationDescription varchar(256)
)
go

create unique index LocationId
    on Locations (LocationId)
go

create index LocationIndex
    on Locations (LocationName)
go

