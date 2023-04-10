create table MenuHistory
(
    MenuId    int identity
        constraint PK_Menu
            primary key,
    StartDate date not null,
    EndDate   date
)
go

create unique index MenuId
    on MenuHistory (MenuId)
go

