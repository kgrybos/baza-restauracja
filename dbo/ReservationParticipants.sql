create table ReservationParticipants
(
    ReservationId int not null
        constraint FK_ReservationParticipants_Reservation
            references Reservation,
    PersonId      int not null
        constraint FK_ReservationParticipants_IndividualCustomer
            references IndividualCustomer,
    constraint PK_ResParticipants
        primary key (ReservationId, PersonId)
)
go

