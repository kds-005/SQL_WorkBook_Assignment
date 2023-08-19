use assignment2;

--1
SELECT * from orders order by(amount) desc;

--2
Create table Employee_details1(
Emp_id INT PRIMARY KEY,
Emp_name VARCHAR(20),
Emp_salary INT)

INSERT INTO Employee_details1 values
(1,'Okey',50000),
(2,'Galika',70000),
(3,'Celine',65000),
(4,'Kayli',90000)


Create table Employee_details2(
Emp_id INT PRIMARY KEY,
Emp_name VARCHAR(20),
Emp_salary INT)

INSERT INTO Employee_details2 values
(1,'Celine',50000),
(2,'Okey',70000),
(3,'Kayli',65000),
(4,'Kaycee',90000)


--3
select * from Employee_details1
UNION
select * from Employee_details2

--4
select * from Employee_details1
INTERSECT
select * from Employee_details2

--5
select * from Employee_details1
EXCEPT
select * from Employee_details2