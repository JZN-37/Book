--viewing table--

select * from Category
select * from Book
select * from Ratings
select * from Users
select * from Orders


--Creating User--
insert into Users values('shone', 'shone@123',7573092365, 'shonesaji11@gmail.com', 1,0)
insert into Users values('sam', 'sam@123',9786128496, 'sam@gmail.com', 1,0)
insert into Users values('john', 'john@123',9047834655, 'john@gmail.com', 1,0)

insert into Category values('Comedy', 'Comedy Description' , '~/Image/Comedy/ComedyCat.jpg' , 0, 1, 0, '01/02/2021')
insert into Category values('Crime', 'Crime Description' , '~/Image/Crime/CrimeCat.jpg' , 0, 1, 0, '01/03/2021')
insert into Category values('Horror', 'Horror Description' , '~/Image/Horror/HorrorCat.jpg' , 0, 1, 0, '09/08/2021')
insert into Category values('SciFi', 'Science Fiction Description' , '~/SciFi/Comedy/SciFiCat.jpg' , 0, 1, 0, '11/01/2021')


--Query to get popular books given Category--
select * from Book where Book.BCatId = 1 order by BPosition desc


--Book--
--Checking trgAInsrtBk trigger--
insert into Book values(2,'Born a Crime',978389667,'2020', 14.99, 'Author : Trevor Noah ', 0, 5, 1,'~/Images/Comedy/BornACrime.jpg' , 0)
insert into Book values(1,'Before and After Laughter',978152941,'2019', 8.99, 'Author : Jimmy Carr ', 0, 2, 1,'~/Images/Comedy/BefnAftLftr.jpg' , 0)
insert into Book values(2, 'A Place of Execution' ,978497131, '2021' , 18.99,  'Author : Val Mc Dermid ' , 0, 10, 1,'~/Images/Comedy/APlaceOfExec.jpg' , 0)
insert into Book values(3, 'Dracula' ,756139713 , '2021' , 13.99,  'Author : Bram Stoker ' , 0, 5, 1,'~/Images/Comedy/Dracula.jpg' , 0)
insert into Book values(4, 'The Martian' ,978497141,  '2017' , 18.99,  'Author : Andy Weir ' , 0, 2, 1,'~/Images/Comedy/TheMartian.jpg' , 0)

--Checking trgADelBk trigger--
delete from Book where BTitle = 'The Martian'
delete from Category where CatName = 'Crime'
--Possible changes:
--

--Checking trgIUpdtBk trigger--
Update Category set CatCount=0 where CatId=1


--Adding Ratings--
--Checked trgAIRatings trigger--
insert into Ratings values(1 , 1, 4)
insert into Ratings values(2 , 1, 5)
insert into Ratings values(3 , 1, 5)
insert into Ratings values(3 , 3, 5)
insert into Ratings values(1 , 3, 0)
insert into Ratings values(3 , 2, 3)




--Testing Orders--
--First we need to increment the UOrderNo (which acts as orderId ie the no of orders made by user with a given id) in Users table by 1 before inserting the records
exec usp_BeforeInsrtToOrders 1 --1 is the userId--
insert into Orders(UserId, BookId, BookQty, OrderDate) values(1, 1,1, '10/10/2021' ) --calls the trgIInsrtOrders which is an "instead of insert" type trigger--
insert into Orders(UserId, BookId, BookQty, OrderDate) values(1, 2,2, '10/10/2021' )
insert into Orders(UserId, BookId, BookQty, OrderDate) values(1, 3,5, '10/10/2021' )
--The next insertion is for the same user with Id=1 but on a different order ; 
--So first execute the stored procedure to increment the UOrderNo (ie the NO OF order made by user) and then insert the record
exec usp_BeforeInsrtToOrders 1
insert into Orders(UserId, BookId, BookQty, OrderDate) values(1, 4,4, '11/10/2021' )


--Query to select orders made by a given user
select * from Orders where UserId = 1

