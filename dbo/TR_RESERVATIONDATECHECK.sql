Create TRIGGER TR_RESERVATIONDATECHECK on Reservation
    for insert, update
    as
    begin
        if(select COUNT(*) from inserted) > 1
        begin
            RAISERROR ('Nie może być więcej niż 1 rekord', 16,1)
            rollback TRANSACTION
        end
        else if (select StartDate from inserted) > (Select EndDate from inserted)
            begin
                RAISERROR ('Koniec nie może być przed początkiem', 16,1)
                rollback transaction
            end
    end
go

