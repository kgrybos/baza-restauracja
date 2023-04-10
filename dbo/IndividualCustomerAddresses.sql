create table IndividualCustomerAddresses
(
    PersonId   int not null
        constraint IndividualCustomerAddresses_pk
            primary key
        constraint IndividualCustomerAddresses_Customers_null_fk
            references IndividualCustomer
            on update cascade on delete cascade,
    Address    varchar(256),
    Region     varchar(256),
    City       varchar(256),
    PostalCode varchar(256)
        constraint CH_IndividualPostalCode
            check ([PostalCode] like '[0-9][0-9]-[0-9][0-9][0-9]' OR [PostalCode] like '[0-9][0-9][0-9]-[0-9][0-9][0-9]')
)
go

