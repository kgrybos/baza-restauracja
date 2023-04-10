create table Menu
(
    MenuId    int not null
        constraint FK_MenuProducts_Menu
            references MenuHistory,
    ProductId int not null
        constraint FK_MenuProducts_Products
            references Products,
    UnitPrice money
        constraint DF_Menu_UnitPrice default 0
        constraint CK_UnitPrice
            check ([UnitPrice] >= 0),
    constraint PK_MenuProds
        primary key (ProductId, MenuId)
)
go

create unique index menuItem
    on Menu (MenuId, ProductId)
go

