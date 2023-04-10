CREATE VIEW FreeTables AS
SELECT T.TableId FROM Tables AS T
WHERE T.TableId NOT IN (SELECT RD.TableId
                        FROM Reservation AS R
                                 JOIN ReservationDetails RD on R.ReservationId = RD.ReservationId
                        WHERE (GETDATE() BETWEEN R.StartDate AND R.EndDate))
go

