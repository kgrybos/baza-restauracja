create table ReservationDetails
(
    ReservationId int not null
        constraint FK_ReservationDetails_Reservation
            references Reservation,
    TableId       int not null
        constraint FK_ReservationDetails_Tables
            references Tables,
    constraint PK_ResDetails
        primary key (ReservationId, TableId)
)
go

create unique index tableDetails
    on ReservationDetails (ReservationId, TableId)
go

