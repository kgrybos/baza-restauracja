create table OrderDetails
(
    OrderId        int                                not null
        constraint FK_OrderDetails_Orders
            references Orders,
    ProductId      int                                not null
        constraint FK_OrderDetails_Products
            references Products,
    Quantity       int
        constraint DF_OrderDetails_Quantity default 0 not null
        constraint CH_ODQuantity
            check ([Quantity] >= 0),
    DiscountId     int   default NULL
        constraint FK_OrderDetails_discounts
            references Discounts,
    MenuId         int                                not null,
    DiscountType   smallint,
    DiscountAmount money default 0                    not null,
    constraint PK_OrderDetails
        primary key (OrderId, ProductId)
)
go

create unique index OrderDetailsProducts
    on OrderDetails (OrderId, ProductId)
go

