+----------+----------+-----------+
| personId | lastName | firstName |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+
Address table:
+-----------+----------+---------------+------------+
| addressId | personId | city          | state      |
+-----------+----------+---------------+------------+
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |
+-----------+----------+---------------+------------+
Output:
+-----------+----------+---------------+----------+
| firstName | lastName | city          | state    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | Null          | Null     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+

--Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.
select p.firstName,p.lastName,a.city, a.state from Address  a right join Person p on a.personId=p.personId;


--2--easy
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output:
+----------+
| Employee |
+----------+
| Joe      |
+----------+

    --Write an SQL query to find the employees who earn more than their managers.
select e.name as Employee from Employee e right join Employee m on e.managerId=m.id where e.salary>m.salary;


--3--easy
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output:
+---------+
| Email   |
+---------+
| a@b.com |

    --Write an SQL query to report all the duplicate emails.
    -- Note that it's guaranteed that the email field is not NULL.
select email as Email from Person  having count(email)>1;


--4--easy
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
    --Find all customers who never order anything.
select c.name as Customers from Orders o right join Customers c on o.customerId=c.id where o.customerId is null;


--5--Medium
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+

    --Find employees who have the highest salary in each of the departments.
select d.name as Department, e.name as Employee, e.salary as Salary from Employee e join Department d on e.departmentId = d.id where e.salary = (select  max(salary) from Employee where departmentId = 1) and e.departmentId = 1 or e.salary = (select max(salary) from Employee where departmentId = 2) and e.departmentId = 2;


--6--easy
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+

--Delete all the duplicate emails, keeping only one unique email with the smallest id.

--For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

    delete p1 from Person p1, Person p2 where p1.email = p2.email and p1.id > p2.id;


