CREATE VIEW CurrentReservations AS
SELECT R.ReservationId, T.TableId, L.LocationName FROM Reservation R
INNER JOIN ReservationDetails RD on R.ReservationId = RD.ReservationId
INNER JOIN Tables T on T.TableId = RD.TableId
INNER JOIN Locations L on L.LocationId = T.LocationId
WHERE Confirmed=1 AND GETDATE() BETWEEN R.StartDate AND R.EndDate
go

