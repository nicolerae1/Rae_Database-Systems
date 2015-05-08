﻿
--
-- The table of courses.
--
create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);


insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

select * 
from courses
order by num ASC;


--
-- Courses and their prerequisites
--
create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

select *
from Prerequisites
order by courseNum DESC;


--
-- An example stored procedure ("function")
--
create or replace function get_courses_by_credits(int, REFCURSOR) returns refcursor as 
$$
declare
   num_credits int       := $1;
   resultset   REFCURSOR := $2;
begin
   open resultset for 
      select num, name, credits
      from   courses
       where  credits >= num_credits;
   return resultset;
end;
$$ 
language plpgsql;

select get_courses_by_credits(0, 'results');
Fetch all from results;

--
--Function One
--
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
	course_num int :=$1;
	resultset REFCURSOR :=$2;
begin
	open resultset for
		select courseNum, preReqNum
		from prerequisites
		where courseNum >= course_num;
	return resultset;
end;
$$
language plpgsql;

select PreReqsFor(0, 'results');
Fetch all from results;

--
--Function Two
--

create or replace function IsPreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
	course_num int :=$1;
	resultset REFCURSOR :=$2;
begin
	open resultset for
		select Courses.name, Prerequisites.courseNum, Prerequisites.preReqNum
		from Courses, Prerequisites
		where courseNum >= course_num;
	return resultset;
end;
$$
language plpgsql;

select IsPreReqsFor(0, 'results');
Fetch all from results;
