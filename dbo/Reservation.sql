create table Reservation
(
    ReservationId  int identity
        constraint PK_Reservation
            primary key,
    CustomerId     int     not null
        constraint FK_ReservationCustomerId
            references Customers,
    StartDate      date    not null,
    EndDate        date    not null,
    IsCompany      tinyint not null,
    Confirmed      tinyint,
    numberOfPeople int     not null
)
go

create unique index ReservationId
    on Reservation (ReservationId)
go

