CREATE VIEW TablesStatsWeekly AS
SELECT Tables.TableId, DATEPART(YEAR, R.StartDate) AS Year, DATEPART(WEEK, R.StartDate) AS Week, COUNT(R.ReservationId) AS NumberOfOrders FROM Tables
INNER JOIN ReservationDetails RD on Tables.TableId = RD.TableId
INNER JOIN Reservation R ON RD.ReservationId = R.ReservationId
GROUP BY Tables.TableId, R.StartDate
go

grant select on TablesStatsWeekly to manager
go

