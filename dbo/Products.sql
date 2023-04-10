create table Products
(
    ProductId    int identity
        constraint PK_Products
            primary key,
    ProductName  varchar(256)                not null,
    CategoryId   int                         not null
        constraint FK_Products_Categories
            references Categories,
    UnitsInStock int
        constraint DF_UnitsInStock default 0 not null
        constraint CH_UnitsInStock
            check ([Products].[UnitsInStock] >= 0),
    UnitsOrdered int
        constraint DF_UnitsOrdered default 0 not null
        constraint CH_UnitsOrdered
            check ([Products].[UnitsOrdered] >= 0),
    DefaultPrice int
        constraint DF_Products_DefaultPrice default 0
        constraint CH_DefaultPrice
            check ([Products].[DefaultPrice] >= 0)
)
go

create unique index ProductId
    on Products (ProductId)
go

create index ProductIndex
    on Products (ProductName)
go

