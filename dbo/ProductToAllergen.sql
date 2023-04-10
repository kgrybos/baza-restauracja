create table ProductToAllergen
(
    ProductId   int not null
        constraint FK_ProductToAllergen_Products
            references Products,
    AllergentId int not null
        constraint FK_ProductToAllergen_Allergens
            references Allergens,
    constraint PK_ProductToAllergen
        primary key (ProductId, AllergentId)
)
go

create unique index allergentId
    on ProductToAllergen (AllergentId, ProductId)
go

create unique index allergentToProduct
    on ProductToAllergen (AllergentId, ProductId)
go

