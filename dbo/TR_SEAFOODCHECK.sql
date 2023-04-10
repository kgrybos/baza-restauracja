CREATE TRIGGER TR_SEAFOODCHECK on OrderDetails
    AFTER INSERT
    as
    begin
        SET NOCOUNT ON;
        if exists (
            SELECT * from inserted i
            inner join Orders o on o.OrderId = i.OrderId
            inner join Products P on P.ProductId = i.ProductId
            where
                p.CategoryId = 12 and not (DATENAME(WEEKDAY ,o.RealiseDate) = 'Thursday'
                                               or DATENAME(WEEKDAY ,o.RealiseDate) = 'Friday'
                                               or DATENAME(WEEKDAY ,o.RealiseDate) = 'Saturday' ))
        begin
            THROW 50001, N'Owoce morza nie mogą być zamówione na dany dzień', 1
        end
        else if exists(
            SELECT * from inserted i
            inner join Orders o on o.OrderId = i.OrderId
            inner join Products P on P.ProductId = i.ProductId
            where
                p.CategoryId = 12 and (
                    (DATENAME(WEEKDAY ,o.RealiseDate) = 'Thursday' and DATEDIFF(DAY, o.OrderDate, o.RealiseDate) <= 2) or
                    (DATENAME(WEEKDAY ,o.RealiseDate) = 'Friday' and DATEDIFF(DAY, o.OrderDate, o.RealiseDate) <= 3) or
                    (DATENAME(WEEKDAY ,o.RealiseDate) = 'Saturday' and DATEDIFF(DAY, o.OrderDate, o.RealiseDate) <= 4)
                )
            )

            begin
                THROW 50001, N'Zamówienie zostało złożone za późno', 1
            end
    end
go

