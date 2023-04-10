CREATE VIEW ReservationsInfo AS
SELECT R.ReservationId, T.TableId, L.LocationName, R.StartDate, R.EndDate, R.Confirmed FROM Reservation R
INNER JOIN Customers C on C.CustomerId = R.CustomerId
INNER JOIN ReservationDetails RD on R.ReservationId = RD.ReservationId
INNER JOIN Tables T on T.TableId = RD.TableId
INNER JOIN Locations L on L.LocationId = T.LocationId
go

grant select on ReservationsInfo to normalEmployee
go

