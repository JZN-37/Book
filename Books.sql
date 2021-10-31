use BookStoreApp

create table Category
(
CatId int primary key identity,
CatName nvarchar(50) unique,
CatDesc nvarchar(150),
CatImgPath nvarchar(150),
CatCount int,  
CatStatus bit, --if 0 make UI disabled--
CatPosition float default 0,
CatCreatedAt datetime
)

create table Book
(
BId int primary key identity,      
BCatId int foreign key references Category(CatId),
BTitle nvarchar(50) not null,
BISBN nvarchar(50) not null,
BYear date,   --Year--
BPrice float,
BDesc nvarchar(500), -- Place a limit of 500 characters in UI--
BPosition float default 0,
BCount int,
BStatus bit,
BImgPath nvarchar(150),
Norders int
)

create table Ratings
(
RatingId int unique identity,
UserId int foreign key references Users(Id),
BId int foreign key references Book(BId),
UserRating float, --make sure the upper limit is set in the UI TO 5--
Constraint pkUsrBk primary key(UserId,BId)
)

create table Cart
(
CartId int unique identity,
UserId int foreign key references Users(Id),
BId int foreign key references Book(BId),
BQty int
Constraint pkUsrBook primary key(UserId,BId)
)


