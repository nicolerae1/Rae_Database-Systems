create database storeSKU

create table Clothes
(
	SKU_ID int,
	Item varchar(200),
	RetailUSD varchar(200),
	QOH int,
	PRIMARY KEY (SKU_ID)
);

create table purchaseOrders
(
	purchase_ONo varchar(200),
	Supplier varchar (200),
	SKU_ID int, 
	Quant_SKU int,
	pricePerUSD varchar(200),
	orderDate date,
	purchaseComments varchar(200),
	PRIMARY KEY (purchase_ono),
	FOREIGN KEY (SKU_ID) REFERENCES Clothes(SKU_ID)
);

create table Suppliers
(
	S_ID serial PRIMARY KEY,
	Supplier varchar(200),
	strAddress varchar(200),
	zip varchar(200),
	contact varchar(200),
	payMethod varchar(200)
);

create table S_info
(	
	zip varchar(200) PRIMARY KEY, 
	city varchar(200), 
	state varchar(200)
);

select * from clothes

--insert test data into table Clothes
insert into Clothes 
(sku_id, item, retailusd, qoh)
values
(1, 'sweater', '$15.00', '300');

insert into Clothes 
(sku_id, item, retailusd, qoh)
values
(2, 'vest', '$12.00', '300');

insert into Clothes 
(sku_id, item, retailusd, qoh)
values
(3, 'skirt', '$10.00', '350');

insert into Clothes 
(sku_id, item, retailusd, qoh)
values
(4, 'pants', '$20.00', '400');

insert into Clothes 
(sku_id, item, retailusd, qoh)
values
(5, 'shorts', '$14.00', '350');

select * from clothes
select * from purchaseOrders

--insert test data into table purchaseOrders
insert into purchaseOrders
(purchase_ono, supplier, sku_id, quant_sku, priceperusd, orderdate, purchasecomments)
values
(100, 'Little Darling', 2, '30', '$12.00', '2014-09-20', '15 grey/15 blue');

insert into purchaseOrders
(purchase_ono, supplier, sku_id, quant_sku, priceperusd, orderdate, purchasecomments)
values
(101, 'School Clothes', 5, '50', '$14.00', '2014-07-10', 'none');

insert into purchaseOrders
(purchase_ono, supplier, sku_id, quant_sku, priceperusd, orderdate, purchasecomments)
values
(102, 'Little Darling', 1, '60', '$15.00', '2015-01-05', 'all size medium');

insert into purchaseOrders
(purchase_ono, supplier, sku_id, quant_sku, priceperusd, orderdate, purchasecomments)
values
(103, 'Catholic Trinity', 3, '25', '$10.00', '2014-05-13', 'all white');

insert into purchaseOrders
(purchase_ono, supplier, sku_id, quant_sku, priceperusd, orderdate, purchasecomments)
values
(104, 'All Boys School', 4, '150', '$20.00', '2014-09-20', 'mixed colors');

--insert test data into table Suppliers
insert into Suppliers
(supplier, straddress, zip, contact, paymethod)
values 
('Little Darling', '95 Hope Street', '12524', '845-555-7889', 'Visa - xxxxxxxxx3492');


insert into Suppliers
(supplier, straddress, zip, contact, paymethod)
values 
('All Boys School', '12 Franklin Avenue', '12557', '845-578-2839', 'AMEX - xxxxxxxxx4672');


insert into Suppliers
(supplier, straddress, zip, contact, paymethod)
values 
('All Girls School', '30 Hyde Street', '12644', '914-234-7854', 'Visa - xxxxxxxxx7732');


insert into Suppliers
(supplier, straddress, zip, contact, paymethod)
values 
('School Clothes', '422 Violet Avenue', '12601', '845-244-0378', 'Discover - xxxxxxxxx2134');


insert into Suppliers
(supplier, straddress, zip, contact, paymethod)
values 
('Catholic Trinity', '7 Main Street', '12603', '914-223-4326', 'MC - xxxxxxxxx0281');


insert into Suppliers
(supplier, straddress, zip, contact, paymethod)
values 
('Clothes For All', '39 Grange Road', '13509', '914-205-8235', 'AMEX - xxxxxxxxx9999');

select * from suppliers
select * from s_info

--entering test data into s_info
insert into s_info
(zip, city, state)
values 
('12524', 'Fishkill', 'NY');

insert into s_info
(zip, city, state)
values 
('12557', 'Weschester', 'NY');

insert into s_info
(zip, city, state)
values 
('12644', 'New Paltz', 'NY');

insert into s_info
(zip, city, state)
values 
('12601', 'Poughkeepsie', 'NY');

insert into s_info
(zip, city, state)
values 
('13509', 'Pawling', 'NY');


--Number 5 
--Write a query to calculate available SKU
--defined as the amount on hand plus amount on order
select * from purchaseOrders


select c.sku_id, c.sum(qoh), o.sum(quant_sku)
from Clothes c, purchaseOrders o
group by sku_id;

select c.sku_id, sum(qoh) as SumOfQOH, sum (quant_sku) as SumOfQuant, sum(qoh)+sum(quant_sku) as TotalAvailable
from clothes c JOIN purchaseOrders p 
ON c.sku_id = p.sku_id
group by c.sku_id


