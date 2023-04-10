create table CustomerStats
(
    PersonId        int                                     not null
        constraint PK_CustomerStats
            primary key
        constraint FK_CustomerStats_IndividualCustomer
            references IndividualCustomer,
    SumOfOrders     float
        constraint DF_CustomerStats_SumOfOrders default 0   not null,
    CountOfOrders   int
        constraint DF_CustomerStats_CountOfOrders default 0 not null,
    StartOfDiscount date default NULL,
    EndOfDiscount   date default NULL
)
go

