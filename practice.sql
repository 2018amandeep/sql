select class, AVG(level) as avg_level
from characters
where is_alive = TRUE
group by class
having avg(level) > 22
order by avg(level) desc
limit 5
