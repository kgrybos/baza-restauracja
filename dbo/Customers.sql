create table Customers
(
    CustomerId int identity
        constraint PK_Customers
            primary key,
    Phone      varchar(256)
        constraint CH_CustomerPhone
            check ([Phone] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR
                   [Phone] like '+48[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Email      varchar(256) not null
        constraint UQ_CustomerMail
            unique
        constraint CH_CustomerMail
            check ([Email] like '%_@_%')
)
go

create unique index CustomersPhone
    on Customers (Phone)
go

create unique index CustomersEmail
    on Customers (Email)
go

create unique index CustomersId
    on Customers (CustomerId)
go

create index CustomersPhoneIndex
    on Customers (Phone)
go

create index CustomersEmailIndex
    on Customers (Email)
go

grant delete, insert, select, update on Customers to manager
go

