CREATE PROCEDURE AddAllergen @AllergenName varchar(256)
AS
    INSERT INTO Allergens (AllergentName)
    VALUES (@AllergenName)
go

grant execute on AddAllergen to normalEmployee
go

