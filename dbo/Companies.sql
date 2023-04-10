create table Companies
(
    CustomerId  int          not null
        constraint FK_Companies_Customers
            references Customers,
    CompanyName varchar(256) not null,
    NIP         varchar(256) not null
        constraint CH_Nip
            check ([NIP] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    CompanyId   int identity
        constraint PK_Companies
            primary key,
    Address     varchar(256),
    Region      varchar(256),
    City        varchar(256),
    PostalCode  varchar(256)
        constraint CH_CompanyPostalCode
            check ([PostalCode] like '[0-9][0-9]-[0-9][0-9][0-9]' OR [PostalCode] like '[0-9][0-9][0-9]-[0-9][0-9][0-9]')
)
go

grant delete, insert, select, update on Companies to manager
go

