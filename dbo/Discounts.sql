create table Discounts
(
    DiscountId        int identity
        primary key,
    StartDate         date                                  not null,
    EndDate           date,
    PercentageOnce    float
        constraint DF_discounts_PercentageOnce default 0    not null
        constraint CH_PercentageOnce
            check ([PercentageOnce] > 0 AND [PercentageOnce] < 1),
    MinOrderCountOnce int
        constraint DF_discounts_MinOrderCountOnce default 0 not null,
    MinOrderPriceOnce int
        constraint DF_discounts_MinOrderPriceOnce default 0 not null
        constraint CH_MinOrderPriceOnce
            check ([MinOrderPriceOnce] >= 0),
    PercentageLong    float
        constraint DF_discounts_PercentageLong default 0    not null
        constraint CH_PercentageLong
            check ([PercentageLong] > 0 AND [PercentageLong] < 1),
    MinSpentLong      int
        constraint DF_discounts_MinSpentLong default 0      not null
        constraint CH_MinSpentLong
            check ([MinSpentLong] > 0),
    DaysActive        int
        constraint DF_discounts_DaysActive default 0        not null
        constraint CH_DaysActive
            check ([DaysActive] >= 0)
)
go

