USE assignment;

CREATE TABLE Employee(
Employee_id INT PRIMARY KEY,
First_name VARCHAR(20) NOT NULL,
Last_name VARCHAR(20) NOT NULL,
Salary INT NOT NULL,
Joining_date DATE NOT NULL,
Department VARCHAR(30) NOT NULL);

INSERT INTO Employee values
(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
(2,'Venna','Verma',80000,'2011-06-15 9:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR'),
(4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin'),
(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
(8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin');

select * from Employee;

CREATE TABLE Employee_Bonus(
Employee_ref_id INT FOREIGN KEY REFERENCES Employee(Employee_id),
Bonus_Amount INT NOT NULL,
Bonus_Date DATE NOT NULL);

INSERT INTO Employee_Bonus values
(1,5000,'2020-02-16 0:00:00'),
(2,3000,'2011-06-16 0:00:00'),
(3,4000,'2020-02-16 0:00:00'),
(1,4500,'2020-02-16 0:00:00'),
(2,3500,'2011-06-16 0:00:00');

select * from Employee_Bonus;

CREATE TABLE Employee_Title(
Employee_ref_id INT FOREIGN KEY REFERENCES Employee(Employee_id),
Employee_title VARCHAR(30) NOT NULL,
Affective_Date DATE NOT NULL);

INSERT INTO Employee_Title values
(1,'Manager','2016-02-20 0:00:00'),
(2,'Executive','2016-06-11 0:00:00'),
(8,'Executive','2016-06-11 0:00:00'),
(5,'Manager','2016-06-11 0:00:00'),
(4,'Asst. Manager','2016-06-11 0:00:00'),
(7,'Executive','2016-06-11 0:00:00'),
(6,'Lead','2016-06-11 0:00:00'),
(3,'Lead','2016-06-11 0:00:00');

select * from Employee_Title;




--1
Select First_name as Employee_name from Employee;

--2
Select UPPER(Last_name) as Employee_name from Employee;

--3
Select Distinct(Department) from Employee;

--4
Select Left(Last_name,3) from Employee;

--5
Select Distinct(Department),len(Department) from Employee;

--6
Select (First_name + ' ' + Last_name) as Full_Name from Employee;

--7
Select * from Employee order by(First_name);

--8
Select * from Employee order by First_name ASC, Department DESC;

--9
Select * from Employee 
where First_name = 'VENNA' or First_name = 'KARAN';

--10
Select * from Employee
where Department = 'Admin';

--11
Select *  from Employee
where First_name LIKE '%V%';

--12
Select * from Employee
where Salary Between 100000 and 500000;

--13
Select * from Employee
where Joining_date >= '2020-02-01' and Joining_date < '2020-02-29';

--14
Select * from Employee
where Salary >= 50000 and Salary <= 100000;

--16
Select Employee.Employee_id, Employee.First_name, Employee.Last_name, 
Employee.Salary, Employee.Joining_date, Employee.Department
from Employee INNER JOIN Employee_Title 
ON Employee.Employee_id = Employee_title.Employee_ref_id
Where Employee_title.Employee_title = 'Manager';

--17
Select Department, COUNT(Department) as Count 
from Employee
Group by Department
HAVING COUNT(Department) > 1;

--18
Select * from Employee
Where Employee_id % 2 !=0;

--19
Select * into New_Employee from Employee;
Select * from New_Employee;

--20
Select Top 2 Salary from Employee 
order by Salary Desc;

--21
Select * from Employee
where Salary in 
(Select Salary from Employee
Group by Salary
Having COUNT(*)>1);

--22
Select Max(Salary) from Employee
Where Salary not in
(Select Max(Salary) from Employee);

--23
Select * from Employee
Where Employee_id <= 
(Select Count(*) from Employee)/2;

--24
Select Department from Employee
group by Department
Having Count(Department) < 4;

--25
Select Department, Count(Department) as Count 
from Employee
Group by Department;

--26
Select (First_name+' '+Last_name) as Employee , Department
from Employee
Where Salary in
(Select Max(Salary) from Employee
Group by Department	);

--27
Select (First_name+' '+Last_name) as Employee
from Employee
Where Salary in
(Select MAX(Salary) from Employee);

--28
Select AVG(Salary) as AVG_Salary, Department 
from Employee
Group by Department;

--29
Select (Employee.First_name+' '+Employee.Last_name) as Employee, 
Employee_Bonus.Bonus_Amount as Bonus
from Employee INNER JOIN Employee_Bonus
ON Employee.Employee_id = Employee_Bonus.Employee_ref_id
Where Employee_Bonus.Bonus_Amount in 
(Select MAX(Bonus_Amount) from Employee_Bonus);

--30
Select Employee.First_name, Employee_Title.Employee_title
from Employee INNER JOIN Employee_Title
ON Employee.Employee_id = Employee_Title.Employee_ref_id; 