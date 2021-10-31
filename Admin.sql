create database BookStoreApp
use BookStoreApp

create table Admin
(
AId int primary key identity,
AName nvarchar(50),
APwd nvarchar(50)
)

create table Discount
(
DId int primary key identity,
DCouponCode nvarchar(50),
DDiscountValue float,
DStatus bit
)

create table Orders
(
UserId int foreign key references Users(Id),
OrderId int,
BookId int foreign key references Book(BId),
BookQty int,
OrderDate datetime
)

create proc usp_BeforeInsrtToOrders(@userId int)
with encryption
as
begin
update Users set UOrderNo=UOrderNo+1 where Id= @userId
end