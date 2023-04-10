Create TRIGGER TR_ODERDDATECHECK on Orders
    for insert
    as
    begin
        if(select COUNT(*) from inserted) > 1
        begin
            RAISERROR ('Nie może być więcej niż 1 rekord', 16,1)
            rollback TRANSACTION
        end
        else if (select OrderDate from inserted) > (Select RealiseDate from inserted)
            begin
                RAISERROR ('Koniec nie może być przed początkiem', 16,1)
                rollback transaction
            end
    end
go

