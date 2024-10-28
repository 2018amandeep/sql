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

