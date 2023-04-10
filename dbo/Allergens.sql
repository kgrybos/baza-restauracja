create table Allergens
(
    AllergentId   int identity
        constraint PK_Allergens
            primary key,
    AllergentName varchar(256) not null
        constraint UC_Allergens
            unique
)
go

create unique index AllergentId
    on Allergens (AllergentId)
go

create index AllergentIndex
    on Allergens (AllergentName)
go

