CREATE VIEW LocationsStatsMonthly AS
SELECT LocationName, DATEPART(YEAR , R2.StartDate) AS Year,  DATEPART(Month, R2.StartDate) AS Month, COUNT(DISTINCT R2.ReservationId) AS NumberOfOrders FROM Locations
INNER JOIN Tables T on Locations.LocationId = T.LocationId
INNER JOIN ReservationDetails RD on T.TableId = RD.TableId
INNER JOIN Reservation R2 on R2.ReservationId = RD.ReservationId
GROUP BY LocationName, R2.StartDate
go

grant select on LocationsStatsMonthly to manager
go

