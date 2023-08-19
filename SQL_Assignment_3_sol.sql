USE assignment2;

--1
CREATE TABLE orders
(order_id INT PRiMARY KEY,
order_date DATE,
amount INT,
customer_id INT FOREIGN KEY REFERENCES customers(customer_id));


INSERT INTO orders VALUES
(101, '18-feb-2021',50000,2),
(102, '02-may-2022',45000,1),
(103, '13-jun-2022',98000,2),
(104, '19-feb-2021',23000,3),
(105, '08-jan-2022',60000,2),
(106, '01-oct-2022',85000,1)

--2
select customers.first_name, customers.address, orders.order_date 
from orders INNER JOIN customers ON
orders.customer_id = customers.customer_id;

--3
select customers.first_name, customers.address, orders.order_date 
from orders LEFT JOIN customers ON
orders.customer_id = customers.customer_id;


select customers.first_name, customers.address, orders.order_date 
from orders RIGHT JOIN customers ON
orders.customer_id = customers.customer_id;

--4
update orders 
SET amount = 100
where customer_id = 3;

select * from orders;