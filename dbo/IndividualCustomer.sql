create table IndividualCustomer
(
    CustomerId int          not null
        constraint FK_IndividualCustomer_Customers
            references Customers,
    FirstName  varchar(256) not null,
    LastName   varchar(256) not null,
    CompanyId  int
        constraint FK_IndividualCustomer_Companies
            references Companies,
    PersonId   int identity
        constraint PK_IndividualCustomer
            primary key
)
go

create unique index PersonId
    on IndividualCustomer (PersonId)
go

grant delete, insert, select, update on IndividualCustomer to manager
go

