select class, AVG(level) as avg_level  --fifth oeder
from characters   -- First order
where is_alive = TRUE -- Second order
group by class -- Third order
having avg(level) > 22 -- Fourth order
order by avg(level) desc -- Six order
limit 5 -- Seven order

-- Order here is order of execution

-- Order of SQL Clauses
    --1. Lexical Order: Order in which clauses are written
    --2. Login Order: Order in which clauses are executed logically
    --3. Effect Order: True order of execution after the engines optimization

-- Logocal order of sql operations
    --1. FROM, JOIN
    --2. WHERE
    --3. GROUP BY
    --4. AGGREGATION
    --5. HAVING
    --6. WINDOW
    --7. SELECT, ALIAS
    --8. DISTINCT
    --9. UNION(ALL)
    --10. ORDER BY
    --11. LIMIT, OFFSET
    --12. FETCH, NEXT

//