create table ReservationRequirements
(
    ResReqId       int identity
        primary key,
    MinOrdersCount int not null,
    MinSpent       int not null
)
go

