CREATE FUNCTION productsWithGivenAllergent(@allergent varchar)
RETURNS table AS RETURN
        select ProductId from ProductToAllergen
            inner join Allergens A on ProductToAllergen.AllergentId = A.AllergentId
            where AllergentName = @allergent
go

grant select on productsWithGivenAllergent to normalEmployee
go

