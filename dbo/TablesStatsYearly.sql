CREATE VIEW TablesStatsYearly AS
SELECT Tables.TableId, YEAR(R.StartDate) AS Year, COUNT(R.ReservationId) AS NumberOfOrders FROM Tables
INNER JOIN ReservationDetails RD on Tables.TableId = RD.TableId
INNER JOIN Reservation R ON RD.ReservationId = R.ReservationId
GROUP BY Tables.TableId, R.StartDate
go

grant select on TablesStatsYearly to manager
go

