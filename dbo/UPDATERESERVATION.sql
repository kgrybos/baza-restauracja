Create TRIGGER UPDATERESERVATION on Reservation
  for update
  as
  begin
       if (select Confirmed from inserted) = 2
          begin
              Declare @OrderId INT = (select OrderId from Orders where Orders.ReservationId = (Select ReservationId from inserted));
              UPDATE CustomerStats SET CountOfOrders = CountOfOrders - 1, SumOfOrders = SumOfOrders - (Select order_value from  dbo.orderValue(@OrderId)) WHERE PersonId in (
                  SELECT PersonId from IndividualCustomer where  (select CustomerId from inserted) = IndividualCustomer.CustomerId
                  );
              DELETE FROM OrderDetails where OrderId  = @OrderId
              DELETE FROM Orders where OrderId  = @OrderId
          end
  end
go

