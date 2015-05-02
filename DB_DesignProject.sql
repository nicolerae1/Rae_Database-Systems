create table Packages (
	package_id integer not null,
	description text not null,
	costUSD money not null,
	primary key (package_id)
);	

create table People (
	person_id integer not null unique, 
	first_name varchar(100) not null, 
	last_name  varchar(100) not null,
	DOB	   date		 not null,
	telephone char(15)	not null,
	primary key (person_id)
);

create table Members (
	member_id integer not null,
	person_id integer not null references people (person_id),
	package_id integer not null references packages(package_id),
	primary key (member_id)
);
	
create table Trainers (
	trainer_id integer not null,
	person_id  integer not null references people (person_id), 
	gender char(8) not null,
	constraint check_gender check (gender = 'Male' or gender = 'Female'),
	primary key (trainer_id)
);

create table Classes (
	class_id integer not null,
	class_name text not null,
	description text not null,
	primary key (class_id)
);

create table Schedule (
	s_day date not null,
	s_time time not null,
	class_id integer not null references Classes (class_id),
	trainer_id integer not null references Trainers (trainer_id),
	primary key (s_day, s_time)	
);

drop table schedule

create table snackBar (
	item_id integer not null unique,
	description text not null,
	quant_on_hand integer not null,
	costUSD money not null,
	primary key (item_id)
);

create table Orders (
	order_num integer not null unique,
	person_id integer not null references people (person_id),
	item_id integer not null references snackBar (item_id),
	quant integer not null,
	totalUSD money not null,
	primary key (order_num)
);

--Entry of data into the Packages table
insert into Packages (package_id, description, costUSD)
values (001, 'Regular', 65.00);

insert into Packages (package_id, description, costUSD)
values (002, 'Non-Peak', 75.50);

insert into Packages (package_id, description, costUSD)
values (003, 'Peak', 90.00);

select * from packages

--Entry of data into the People table
insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100000, 'Megan', 'Stacklum', '1992-03-28' , '821-121-2179');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100001, 'Sean', 'Maddie', '1986-06-07' , '914-249-7779');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100002, 'Sharon', 'Holy', '1988-10-21' , '901-923-0086');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100003, 'Chrissy', 'Higgle', '1993-04-14', '201-423-2463');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100004, 'Jimmy', 'Roberts', '1992-02-28', '392-219-4294');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100005, 'Jessie', 'Reespo', '1990-01-02' , '845-316-4496');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100006, 'Hannah', 'Petron', '1991-01-24' , '845-743-2144');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100007, 'Annie', 'Morris', '1963-05-13', '891-309-2302');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100008, 'Anthony', 'Greco', '1993-07-14', '201-731-4289');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100009, 'Rose', 'Rae', '1975-08-27' , '246-312-2316');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100010, 'Louis', 'Mabie', '1994-10-23', '532-891-2635');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100011, 'Nicholas', 'Diccilo', '1994-08-19', '845-293-1034');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100012, 'Victoria', 'Panico', '1995-05-18', '832-491-0234' );

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100013, 'Dana', 'Mia', '1975-11-14' , '892-240-3092');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100014, 'Dolores', 'Gertrude', '1987-12-25' , '245-642-7786');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100015, 'Mike', 'Gruff', '1987-03-20', '352-840-2069');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100016, 'Nicole', 'Hunter', '1994-08-01' , '845-222-8008');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100017, 'Dorsy', 'Picker', '1989-03-04' , '321-986-2621');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100018, 'Joey', 'Kelly', '1968-06-10' , '914-754-2168');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100019, 'Briana', 'Ortiz', '1995-07-23' , '489-313-1129');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100020, 'Brendan', 'Picker', '1977-02-02' , '835-123-5352');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100021, 'Kevin', 'Geeder', '1965-08-01' , '201-677-3268');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100022, 'Jackie', 'Reese', '1987-01-20' , '845-248-7634');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100023, 'Sally', 'Badger', '1994-04-02' , '345-666-4326');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100024, 'Karen', 'Rae', '1967-07-07' , '914-489-5695');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100025, 'Justin', 'Burns', '1990-01-08' , '845-343-5439');

insert into People (person_id, first_name, last_name, DOB, telephone)
values (10100026, 'Heather', 'Kelly', '1990-01-08' , '845-343-5439');

select * from people

--Entry of data into the Members table
insert into Members (member_id, person_id, package_id)
values (000001, 10100000, 002 );

insert into Members (member_id, person_id, package_id)
values (000002, 10100001, 001);

insert into Members (member_id, person_id, package_id)
values (000003, 10100016, 002);

insert into Members (member_id, person_id, package_id)
values (000004, 10100003, 003);

insert into Members (member_id, person_id, package_id)
values (000005, 10100004, 002);

insert into Members (member_id, person_id, package_id)
values (000006, 10100008, 001);

insert into Members (member_id, person_id, package_id)
values (000007, 10100006, 001);

insert into Members (member_id, person_id, package_id)
values (000008, 10100007, 002);

insert into Members (member_id, person_id, package_id)
values (000009, 10100009, 001);

insert into Members (member_id, person_id, package_id)
values (000010, 10100010, 003);

insert into Members (member_id, person_id, package_id)
values (000011, 10100014, 003);

insert into Members (member_id, person_id, package_id)
values (000012, 10100015, 001);

insert into Members (member_id, person_id, package_id)
values (000013, 10100017, 001);

insert into Members (member_id, person_id, package_id)
values (000014, 10100019, 002);

insert into Members (member_id, person_id, package_id)
values (000015, 10100020, 003);

insert into Members (member_id, person_id, package_id)
values (0000016, 10100022, 003);

insert into Members (member_id, person_id, package_id)
values (000017, 10100024, 001);

insert into Members (member_id, person_id, package_id)
values (000018, 10100025, 002);

insert into Members (member_id, person_id, package_id)
values (000019, 10100002, 002);

insert into Members (member_id, person_id, package_id)
values (000020, 10100026, 003);

select * from members

--Entry of data into the Trainers table
insert into Trainers (trainer_id, person_id, gender)
values (00, 10100005, 'Female');

insert into Trainers (trainer_id, person_id, gender)
values (01, 10100011, 'Male');

insert into Trainers (trainer_id, person_id, gender)
values (02, 10100012, 'Female');

insert into Trainers (trainer_id, person_id, gender)
values (03, 10100018, 'Male');

insert into Trainers (trainer_id, person_id, gender)
values (04, 10100021, 'Male');

insert into Trainers (trainer_id, person_id, gender)
values (05, 10100023, 'Female');

select * from trainers

--Entry of data into the Classes table
insert into Classes (class_id, class_name, description)
values (550, 'Overdrive', 'high intensity interval training');

insert into Classes (class_id, class_name, description)
values (551, 'Cardio Tai Box', 'tai box with upbeat music');

insert into Classes (class_id, class_name, description)
values (552, 'Tread & Shed', 'treadmill cardio to melt away calories');

insert into Classes (class_id, class_name, description)
values (553, 'Absolution', 'core strengthening solution');

insert into Classes (class_id, class_name, description)
values (554, 'Beach Body', 'total body conditioning');

insert into Classes (class_id, class_name, description)
values (555, 'Retro-Robics', 'traditional aerobics');

insert into Classes (class_id, class_name, description)
values (556, 'Pound', 'modern-day fusion of movement and music');

insert into Classes (class_id, class_name, description)
values (557, 'Chisel', 'weights and calisthenics');

insert into Classes (class_id, class_name, description)
values (558, 'Boom Move It', 'cardio dance based workout');

insert into Classes (class_id, class_name, description)
values (559, 'Zumba', 'fuses workouts with hypnotic Latin rhythms');

select * from Classes

--Entry of data into the Schedule table
insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-12', '07:00', 550, 02); 

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-12', '12:30', 557, 00);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-12', '15:30', 559, 03);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-12', '18:00', 552, 01);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-12', '20:00', 556, 00);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-13', '7:00', 554, 04);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-13', '12:30', 558, 00);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-13', '15:30', 553, 02);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-13', '18:00', 551, 05);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-13', '20:00', 555, 03);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-14', '7:00', 550, 01);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-14', '12:30', 559, 00);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-14', '15:30', 558, 04);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-14', '18:00', 552, 02);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-14', '20:00', 551, 05);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-15', '7:00', 550, 01);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-15', '12:30', 559, 00);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-15', '15:30', 558, 04);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-15', '18:00', 552, 02);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-15', '20:00', 551, 05);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-16', '7:00', 550, 01);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-16', '12:30', 559, 00);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-16', '15:30', 558, 04);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-16', '18:00', 552, 02);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-16', '20:00', 551, 05);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-17', '7:00', 550, 01);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-17', '12:30', 559, 00);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-17', '15:30', 558, 04);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-17', '18:00', 552, 02);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-17', '20:00', 551, 05);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-18', '7:00', 550, 01);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-18', '12:30', 559, 00);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-18', '15:30', 558, 04);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-18', '18:00', 552, 02);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-18', '20:00', 551, 05);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-19', '7:00', 550, 01);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-19', '12:30', 559, 00);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-19', '15:30', 558, 04);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-19', '18:00', 552, 02);

insert into Schedule (s_day, s_time, class_id, trainer_id)
values ('2015-04-19', '20:00', 551, 05);

select * from schedule

--Entry of data into the SnackBar table
insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (1, 'small water', 500, 1.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (2, 'large water', 500, 2.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (3, 'gatorade', 450, 3.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (4, 'powerade', 300, 2.50);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (5, 'power bar', 250, 4.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (6, 'peanuts', 200, 3.50);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (7, 'protein shake mix', 300, 6.50);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (8, 'women sleeveless tee', 200, 20.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (9, 'women longsleeve shirt', 250, 35.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (10, 'women shortsleeve shirt', 250, 30.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (11, 'women tank', 200, 15.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (12, 'women sweatpants', 300, 42.00 );

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (13, 'women shorts', 150, 24.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (14, 'men sleeveless tee', 200, 20.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (15, 'men longsleeve shirt', 250, 35.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (16, 'men shortsleeve shirt', 250, 30.00 );

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (17, 'men sweatpants', 300, 42.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (18, 'men shorts', 250, 24.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (19, 'adult sweatshirt', 350, 50.00);

insert into snackBar (item_id, description, quant_on_hand, costUSD)
values (20, 'childrens sweatshirt', 200, 30.00);

select * from snackBar;

--Entry of data into the Orders table
insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111111, 10100004, 1, 2, 2.00);

insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111112, 10100001, 6, 1, 3.50);

insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111113, 10100018, 13, 1, 24.00);

insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111114, 10100013, 2, 1, 2.00);

insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111115, 10100005, 5, 1, 4.00);

insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111116, 10100022, 20, 2, 60.00);

insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111117, 10100017, 9, 1, 35.00);

insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111118, 10100003, 7, 1, 6.50);

insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111119, 10100019, 3, 2, 6.00);

insert into Orders (order_num, person_id, item_id, quant, totalUSD)
values (111110, 10100026, 16, 2, 60.00);

select * from orders

--Views
create view memberOverview AS
	select first_name, last_name, members.person_id, member_id as memberNumber, telephone
	from people
	inner join members
	on people.person_id = members.person_id;
	
create view trainerOverview AS
	select first_name, last_name, trainers.person_id, trainer_id as trainerNumber, telephone
	from people
	inner join trainers
	on people.person_id = trainers.person_id;


