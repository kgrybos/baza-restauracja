create table Employees
(
    EmployeeId int identity
        constraint PK_Employees
            primary key,
    LastName   varchar(256) not null,
    FirstName  varchar(256) not null,
    PositionId int          not null
        constraint FK_Employees_Positions
            references Positions,
    BirthDate  date         not null,
    HireDate   date         not null,
    Address    varchar(256) not null,
    City       varchar(256) not null,
    Region     varchar(256) not null,
    PostalCode varchar(256) not null
        constraint CH_PostalCode
            check ([PostalCode] like '[0-9][0-9]-[0-9][0-9][0-9]' OR
                   [PostalCode] like '[0-9][0-9][0-9]-[0-9][0-9][0-9]'),
    Phone      varchar(256) not null
        constraint CH_Phone
            check ([Phone] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR
                   [Phone] like '+48[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Email      varchar(256) not null
        constraint CH_Email
            check ([Email] like '%_@_%'),
    Photo      varchar(1024)
)
go

create unique index EmployeesInd
    on Employees (Email)
go

create unique index EmployeesId
    on Employees (EmployeeId)
go

create index EmployeesIndex1
    on Employees (Phone)
go

create index EmployeesIndex2
    on Employees (Phone)
go

create index EmployeesIndex3
    on Employees (FirstName, LastName)
go

