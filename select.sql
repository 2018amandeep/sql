Select * from Characters;

--Aliasing
select level as avg_level from Characters;

--Constant

select level as avg_level, 1 AS version from Characters -- 1 will be added to all rows by creating a new column

--Calculations

select level, experience, experience * 100 AS multiply, experience + 100 / level * 2 
FROM Characters

-- Function

select experience, SQRT(16), SQRT(experience) as square_root from Characters
select UPPER(guild) as upper_case From characters;

-- Order of execution  
-- functions, multiplications/division, addition/subtraction
-- bracket go first

-- Distinct clause

select distinct class from Characters;

select class, guild
From Characters
Order by class, guild;


-- Create table from another table 

create table database.table_name 
AS (
    select * from database.table where is_Alive = true
)

-- if  table is already exits then

create or replace table database.table -- it will replace the existing table or override it
AS (
    select * from database.table where is_Alive = false
)

-- If we want to leave table untouch if exist then

create table if not exist database.table_name
AS (
    select * from database.table where is_Alive = true
)


-- Set Operations
-- UNIONS
-- No of columns in both tables should match

select * from database.table1

union all -- you will get all data in both the tables regardless they are dublicte
union distinct

selecct * from database.table2

-- EXCEPT
-- give me all the rows from table1 except the rows shared with rows 2
-- order of tables matters

select * from table1

Except distinct -- it is msut to write distinct with except

select * from table2

-- Intersect
-- take only the common elements which are common between both the tables

select * from table1

intersect distinct

select * from table2

-- Type casting
 CAST(column_name AS string) 

-- ORDER by

select * from table1 order by column_name

select * from table2 order by column1, column2  --  first ordery by 1st column the order by 2nd column

-- order by calculation

select * from table1 order by column1, column2 order by level/ experience * 2;

select * from table1 order by 2,1 -- 2,1 denotes here the columns 1-> column1, 2-> column2  

-- Case clause -> Allows to apply logics into table

select name, level, level >= 20 as minimum_level -- it will return as true or false
from characters

--upto 15 -low exp
-- 15- 25 - med exp
-- 25-40 - high exp

select name,
case 
when level <= 15 then 'low exp'
when level >15 and level <=25 then 'medium exp'
when level > 25 'super exp'
end as level_bucket
from characters


to optimize it we can remove level>15 in second condition because it will only come to second statement when it will fail on first statement

so we can write it as 

case 
when level< 15 then ' low'
when level <25 then 'mid'
else 'high'  -- if we remove this statement then it will return null here
end as level_bucket


-- AGGREGATIONS -- 

1. SUM
2. MIN
3. MAX
4. AVG
5. COUNT
6. COUNT/_NUMBER

select sum(level) as sum, min(level), max(level), avg(level), count(level) from charachters. 

-- agg on strings
the way strings are sorted in sql are called lexical graphic order basically a fance word for alphabetical order
Min(String) it will fetch the first string value where Max(string) will return the last string value

STRING_AGG(STRING, ",") --  it will take all the characters and group them with , 
-- agg functions are not allowed on where clause

-- SUBQUERY --
-- find characters whose experience is between min and max
-- more experience than the least experience character , less than the most experience character

    select name,class from characters
    where experience > (
        select min(experience) from characters
    )
    AND experience < (
        select max(experience) from characters 
    )

-- find the difference between a characters's experience and their mentors

-- uncorrelated subqueries
select id as mantee_id, mentor_id, experience as mentee_experience,
(
    select experience from characters where id = mantee_table.mentor_id
)
as mentor_exp
from characters as mantee_table
where mentor_id is not null

-- using cloumn for equations

-- correlated subquery
-- These queries are slow because they run saperately on each row
select id as mantee_id, mentor_id,
(
    select experience from characters where id = mantee_id.mentor_id
) - experience as experience_differencr
from characters as mantee_id
where id is not null


-- Case statements in where clause

select name, level,
case 
when class = 'Mage' then level* 0.5
when class IN ('Archer', 'Warrior') then level* 0.75
else level* 1.5 end as power_level 
FROM characters
where case
     when class = 'Mage' then level*5
     when class IN ('Archer', 'Warrior') then level*7.5
     else level*15 end >= 15

-- Solve same problem using sub queries

    select * from
    (select name, level,
    case 
    when class = 'Mage' then level* 0.5
    when class IN ('Archer', 'Warrior') then level* 0.75
    else level* 1.5 end as power_level 
    FROM characters)
    where power_level>= 15;

-- Another way of doing the same is by creating CTE = **Common Table Expression**

    WITH
    characters_alive as (select * from characters where is_alive = true),
     power_level_exp AS (
        select name, level,
        case when class = 'Mage' then level* 0.5
        when class IN ('Archer', 'Warrior') then level* 0.75
        else level* 1.5 end as power_level
        FROM characters_alive
    )
    Select * from power_level_exp where power_level>= 15;



-- Question Leet Code
Table: Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.
Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the users review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
The result format is in the following example.


    (select name as results
from Users
INNER JOIN MovieRating USING(user_id)
Group by user_id
order by COUNT(rating) DESC, name
limit 1)

union all

(select title as results from Movies
INNER JOIN MovieRating USING(movie_id)
WHERE MONTH(created_at) = '02' and YEAR(created_at) = '2020'
GROUP BY title
ORDER BY AVG(rating) desc, title
limit 1)


select id, COUNT(*) as num from
(select requester_id as id from RequestAccepted
UNION ALL
select accepter_id as id from RequestAccepted) as nums
group by id
order by num desc
limit 1


Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

The result format is in the following example.

 

Example 1:

Input: 
Insurance table:
+-----+----------+----------+-----+-----+
| pid | tiv_2015 | tiv_2016 | lat | lon |
+-----+----------+----------+-----+-----+
| 1   | 10       | 5        | 10  | 10  |
| 2   | 20       | 20       | 20  | 20  |
| 3   | 10       | 30       | 20  | 20  |
| 4   | 10       | 40       | 40  | 40  |
+-----+----------+----------+-----+-----+

select ROUND(SUM(tiv_2016),2) as tiv_2016
from Insurance
where tiv_2015 IN(
    select tiv_2015
    from Insurance
    group by tiv_2015 
    having count(*) > 1
)
and (lat, lon) IN(
    select lat, lon from Insurance
    group by lat, lon
    having COUNT(*) =1
)
-- 45.00

Q.Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

select user_id, 
    CONCAT(UPPER(LEFT(name,1)), LOWER(RIGHT(name, LENGTH(name)-1))) as name
from Users
order by user_id

QWrite a solution to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.

-- GROUP CONCAT
select sell_date, COUNT(DISTINCT product) as num_sold, 
GROUP_CONCAT(
    DISTINCT product
    order by product
    SEPARATOR ','
) as Products 
from Activities
group by sell_date
order by sell_date, product


Q.
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |
+------------------+---------+
product_id is the primary key (column with unique values) for this table.
This table contains data about the companys products.
 

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+
This table may have duplicate rows.
product_id is a foreign key (reference column) to the Products table.
unit is the number of products ordered in order_date.
 

Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
Return the result table in any order.
The result format is in the following example.


select product_name, SUM(unit) as unit
from Products
INNER JOIN Orders USING (product_id)
where MONTH(order_date) = 2 AND YEAR(order_date) = 2020
GROUP BY product_name
HAVING SUM(unit) >=100


Q. Find montly sales and sort it by desc order.

select YEAR(order_date) as year, Month(order_date) as month, SUM(sales) as totalsales
from Sales
Group By Year(order_date), Month(order_date)
order by totalsales desc


select candidate_id, SUM(skills) as skill_count
FROM SKILLS
where skills IN ('SQL', 'Tablue', 'Power BI')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
order by candidate_id asc

Q. Select second highest salary

select name, Max(salary) as salary from employee where salary <>
(select MAX(salary) from employee)

select t1.empname, t2.empid
from emp as T1 
JOIN emp as T2
ON t1.managerid = t2.empid

-- Stored Procedure

Create Procedure spProcedure 
AS
Begin
select * from employee where empId = 1
END

-- Call procedure just by calling its name
-- spProcedure
-- Execute spProcedure
-- EXEC spProcedure


 -- To update stored procedure

 ALTER Procedure spProcedure
 AS
 Begin
 SELECT * FROM EMPLOYEE WHERE EMPID =1;
 SELECT * FROM EMPLOYEE WHERE EMPID =2;
 END;

 -- drop PROCEDURE

 DROP PROCEDURE spProcedure

 -- Stored procedure with parameter

 Create procedure paraProcedure
 @empId int = 1,
 @name varchar(255)= 'Joseph'
 AS
 Begin
 SELECT * FROM EMPLOYEE WHERE EMPID = @empId;
 SELECT * FROM EMPLOYEE WHERE EMPID = @name
 END;

 -- Call procedure with parameter
 -- EXEC paraProcedure @empId =1, @name = 'Aman'

 CREATE PROC spAddDigit
 @Num1 Int,
 @Num3 Int,
 @Result INT OUTPUT
 AS
 Begin
    SET @Result = @Num1 + @Num2;
end;

Declare @Eid int
EXEC spAddDigit 23,27, @Eid OUTPUT;
select @Eid;

select salary from employees pq where 2 = (
    select COUNT(DISTINCT salary) from employee cq where pq.salary <= cq.salary;
)

-- triggers
-- two types of triggers 1. row based trigger, 2. Table based trigger
-- Syntax:
CREATE [OR REPLACE] TRIGGER trigger_name
{ BEFORE | AFTER}
{ INSER [OR] UPDATE [OR] | DELETE}
ON table_name
[for each row]

Declare

delaration statement

Begin
executable- statement
end;

--all employees getting second heighest salary
select name, salary FROM employees where
salary = ( select MAX(salary) from employees where 
salary < (select MAX(salary) from employees)
)

-- view

CREATE VIEW detailView AS 
select name, salary from employees where salary > 70000;

-- convert sting into date
str_to_date

SELECT STR_TO_DATE('27-10-2024', '%d-%m-%y') AS date from employees

-- CONCAT
select concat('hey', '-','buddy') as name

--CONCAT_WS (with saperator)
select concat_ws('-','John','Roy', 'jim','lucy') // john-roy-jim-lucy

-- SUBSTRING
select substring('Hell boy',1,4);
select substring('Hello boy, named rajjo', -5)  // rajjo
select substr('Name is amazing', 1,3)

--REPLACE
REPLACE(str, from_string, to_string)
select replace("Hello Buddy','Hello','Hey");
select replace('abcdef', 'bcd', 'pqr')

--REVERSE
SELECT REVERSE('Hello') // olleH

-- UPPER
SELECT UPPER('Hello') // HELLO
select UCASE('Hello')

--LOWER
SELECT LOWER('HELLo') // hello
SELECT LCASE('hELLO')

-- CHAR_LENGTH  // finds length
select char_length('Raju');

-- INSERT 
select insert('hey whassupp', 6,0, 'Raju '); //hey wRaju hassupp

-- LEFT 
select left('hey whassupp', 3) // hey

-- RIGHT
select right('hey whassupp', 6) // whassupp

-- TRIM
select TRIM('   Hey   ')  // Hey

-- REPEAT
select repeat('😘',100); 

-- group concat
select group_concat(class) from characters; -- my sql

-- string aggregate function

STRING_AGG(column, saperator);

select string_agg(class, ',') from characters; -- mssql

-- LIKE
SELECT * FROM employees WHERE name LIKE '%a%'; // names containing 'a'

1. If you want exact n match character in any column then use n underscores
select * from characters where class like '____';
select * from characters where name like '%k';

-- REGEXP


-- AVG function 
select name, experience from characters where experience =
(select MIN(experience) from characters)

-- DECIMAL

CREATE TABLE Students (
    student_id INT PRIMARY_KEY AUTOINCREMENT,
    name CARCHAR(225) NOT NULL,
    age INT NOT NULL,
    grade DECIMAL(3,1) NOT NILL
)

-- Float
FLOAT - upto ~7 digits, takes 4 bytes of memory
Double - upto ~15 digits, takes 8 bytes of memory


