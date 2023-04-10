create table Orders
(
    OrderId       int identity
        constraint PK_Orders
            primary key,
    CustomerId    int     not null
        constraint FK_Orders_Customers
            references Customers,
    EmployeeId    int
        constraint FK_Orders_Employees
            references Employees,
    OrderDate     date    not null,
    RealiseDate   date,
    ReservationId int
        constraint FK_Orders_Reservation
            references Reservation,
    IsTakeAway    tinyint not null
        constraint CK_IsTakeAway
            check ([IsTakeAway] = 1 OR [IsTakeAway] = 0)
)
go

