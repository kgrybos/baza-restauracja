CREATE VIEW LocationsStatsTotal AS
SELECT LocationName, COUNT(DISTINCT R2.ReservationId) AS NumberOfOrders FROM Locations
INNER JOIN Tables T on Locations.LocationId = T.LocationId
INNER JOIN ReservationDetails RD on T.TableId = RD.TableId
INNER JOIN Reservation R2 on R2.ReservationId = RD.ReservationId
GROUP BY LocationName
go

grant select on LocationsStatsTotal to manager
go

