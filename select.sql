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