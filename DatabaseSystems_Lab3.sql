select *
from customers;

select *
from agents;

select *
from products;

select *
from orders;

--Number 1
select ordno, dollars
from orders;

--Number 2
select name, city
from agents
where name = 'Smith';

--Number 3
select pid, name, priceusd
from products
where (quantity > 200000);

--Number 4
select name, city
from customers
where city = 'Dallas';

--Number 5
select name, city
from agents
where (city <> 'New York') AND (city <> 'Tokyo'); 

--Number 6
select *
from products
where ((city <> 'Dallas') AND (city <> 'Duluth')) AND (priceusd >= 1.00);

--Number 7
select *
from orders
where (mon = 'jan') OR (mon = 'may');

--Number 8
select *
from orders
where (mon = 'feb') AND (dollars > 500.00);

--Number 9
--Lab stated to list all orders, however did not know if you were referring to the order number or all of the data
--Did both
select *
from orders
where (cid = 'c005');

select ordno
from orders
where (cid = 'c005');

--thought I was doing something wrong until I realized there were no orders actually placed for c005.

