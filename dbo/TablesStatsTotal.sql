CREATE VIEW TablesStatsTotal AS
SELECT Tables.TableId, COUNT(R.ReservationId) AS NumberOfOrders FROM Tables
INNER JOIN ReservationDetails RD on Tables.TableId = RD.TableId
INNER JOIN Reservation R ON RD.ReservationId = R.ReservationId
GROUP BY Tables.TableId
go

grant select on TablesStatsTotal to manager
go

