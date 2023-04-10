create table Categories
(
    CategoryId   int identity
        constraint PK_Categories
            primary key,
    CategoryName varchar(256) not null
)
go

create unique index CategoryId
    on Categories (CategoryId)
go

create index CategoryIndex
    on Categories (CategoryName)
go

