CREATE FUNCTION reservationDetailTableDetails(@reservation int)
RETURNS table
    AS return
        select LocationName, LocationDescription from ReservationDetails
            inner join Tables T on ReservationDetails.TableId = T.TableId
            inner join Locations L on T.LocationId = L.LocationId
            where ReservationId = @reservation
            group by LocationName, LocationDescription
go

grant select on reservationDetailTableDetails to normalEmployee
go

