CREATE VIEW TablesStatsMonthly AS
SELECT Tables.TableId,  DATEPART(Year, R.StartDate) AS Year, DATEPART(Month, R.StartDate) AS Month, COUNT(R.ReservationId) AS NumberOfOrders FROM Tables
INNER JOIN ReservationDetails RD on Tables.TableId = RD.TableId
INNER JOIN Reservation R ON RD.ReservationId = R.ReservationId
GROUP BY Tables.TableId, R.StartDate
go

grant select on TablesStatsMonthly to manager
go

