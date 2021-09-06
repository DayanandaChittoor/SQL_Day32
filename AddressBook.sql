create database [AddressBookSystem]
use [AddressBookSystem]

create table AddressBook
(
 ID int identity(1,1) primary key,
 firstname varchar(100) not null,
 lastname varchar(100) not null,
 address varchar(250) not null,
 city varchar(100) not null,
 state varchar(100) not null,
 pincode varchar(6) not null,
 phonenumber varchar(12) not null,
 email varchar(100) not null
);


insert into  AddressBook(firstname,lastname,address,city,state,pincode,phonenumber,email) Values
('Daya','A','5nd cross Indira Nagar','Bangalore','Karnataka','678345','9988776655','daya@gmail.com'),
('Seenu','B','4nd cross Jaya Nagar','Chennai','TamilNadu','563782','7788446655','seenu@gmail.com'),
('Arthi','F','3nd cross Akshay Nagar','Mumbai','Maharastra','857263','2345678191','arthi@gmail.com'),
('Keerthi','D','2nd cross Rajeev Nagar','Kannur','Kerala','844490','0876543212','keerthi@gmail.com'),
('Rajesh','M','1nd cross Prashanth Nagar','Delhi','New Delhi','749729','29852602893','rajesh@gmail.com');

select * from AddressBook

UPDATE AddressBook SET city = 'Hyderabad', state = 'Telangana' WHERE firstname = 'Seenu';
select * from AddressBook;

DELETE FROM AddressBook WHERE firstname='Arthi'
select * from AddressBook

select firstname from AddressBook where city = 'Bangalore' OR state = 'Karnataka'

select COUNT(firstname) from AddressBook where city = 'Kannur' or state = 'Kerala'

select * from AddressBook where city = 'Kannur' order by firstname

alter table AddressBook add Addressbookname varchar(20), type varchar(10)


update AddressBook set Addressbookname='book1', type='Friends' where city='Bangalore';
update AddressBook set Addressbookname='book2', type='Family' where city='Hyderabad'
update AddressBook set Addressbookname='book3', type='Profession' where city='Kannur'

select * from AddressBook

select count(type) as 'family' from AddressBook where type='family'
select count(type) as 'friends' from AddressBook where type='friends'
select count(type) as 'profession' from AddressBook where type='profession'

select * from AddressBook

insert into AddressBook values
('Arun','K','3rd street','Guwahati','Assam','653789','8976538920','arun@gmail.com','book2','Friends');
select * from AddressBook

create table Person
(
person_id int identity(1,1) primary key not null,
firstname varchar(50),
lastname varchar(50),
email varchar(50),
phone varchar(50),
);
select * from person

create table Address
(
person_id int foreign key references person(person_id),
zip int primary key,
city varchar(50),
state varchar(50),
);

select * from address

create table Addressbooks
(
book_id int primary key,
person_id int foreign key references person(person_id),
bookname varchar(50),
booktype varchar(50),
);

select * from Addressbooks

create table Person_Addressbook
(
person_id int foreign key references person(person_id),
book_id int foreign key references addressbooks(book_id)
);

select * from Person_Addressbook

alter table person add zip varchar(20)

select p.firstname as "name",  a.city from person p inner join address a on p.zip=a.zip  where a.city='Banglore';


select a.city,count(city) as 'citycount' from Address a inner join person p on p.zip=a.zip group by city
select a.state, count(state) as 'statecount' from Address a inner join person p on p.zip=a.zip group by state

select p.firstname, a.city from person p inner join address a on p.zip=a.zip where city='Banglore' order by (firstname)