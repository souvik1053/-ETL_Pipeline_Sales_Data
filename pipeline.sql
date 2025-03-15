create database pipeline ;

use pipeline;

create table Customers(
	customer_id int primary key,
    first_name varchar(25),
    last_name varchar(15),
    email varchar(30),
    phone_number int,
    created_at datetime

);

create table Products(
	product_id int primary key,
    product_name varchar(25),
    category varchar(15),
    price float,
    stock_quantity int,
    created_at datetime
);

create table Orders(
     order_id int primary key,
     customer_id int ,
     order_date datetime,
     total_amount float,
     status varchar(10),
     foreign key (customer_id) references Customers(customer_id)
);

create table Payments(
	payment_id int primary key,
    order_id int ,
    payment_method varchar(10),
    payment_status varchar(10),
    payment_date datetime,
    amount_paid float,
    foreign key (order_id) references Orders(order_id)
);

alter table Customers modify phone_number varchar(25);
alter table Customers modify email varchar(255);
alter table Payments modify payment_method varchar(100);
alter table Orders add column Product_id int;
-- Remove the column if it was added previously without constraints
ALTER TABLE Orders DROP COLUMN Product_id;

-- Re-add the column with a foreign key constraint
ALTER TABLE Orders
ADD COLUMN Product_id INT,
ADD CONSTRAINT fk_product
FOREIGN KEY (Product_id) REFERENCES Products(product_id);

set sql_safe_updates = 0;

UPDATE Orders
SET Product_id = FLOOR(1 + (RAND() * 100));

set sql_safe_updates = 1;

select * from Customers;

select * from Products;

select * from Orders;

select * from Payments;

set foreign_key_checks = 0;
truncate table Customers;
set foreign_key_checks = 1;







