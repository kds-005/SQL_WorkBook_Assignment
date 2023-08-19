CREATE DATABASE assignment2;
USE assignment2;

--1
CREATE TABLE customers 
(customer_id INT PRIMARY KEY, 
first_name VARCHAR(255), 
last_name VARCHAR(255), 
email VARCHAR(255), 
address VARCHAR(255), 
city VARCHAR(255), 
state VARCHAR(255), 
zip VARCHAR(255));

--2
INSERT INTO customers VALUES 
(1,'Okey','Schimmel','franco13@example.org','546 Jaquelin Corners\nWest Celestine, WV 28050-8635','Judytown','NewYork','75545'),
(2,'Galika','Hessel','weimann.henri@example.org','130 Lonnie Camp\nCarleyhaven, MS 86397-1888','Luettgenchester','San Jose','66442'),
(3,'Celine','Ruecker','qschowalter@example.net','456 Dickinson Dale\nEast Adanstad, AR 81519-4510','New Amparo','Idaho','45453'),
(4,'Kayli','Osinski','erdman.yessenia@example.net','08056 Harber Creek\nNew Jaquelinmouth, AZ 10415-3998','New Alden','Arizona','79544'),
(5,'Kaycee','Hamill','lurline64@example.org','77664 Schneider Road\nSimonisside, LA 07152-5524','Larsonfort','Indiana','746753');

--3
SELECT first_name, last_name FROM customers

--4
SELECT * FROM customers WHERE first_name LIKE 'G%' AND city = 'San Jose'


