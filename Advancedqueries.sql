use marvelmovies ;

select * from marvelmovies ;

-- Write a query to calculate the rank of movies based on Worldwide Gross partitioned by Year.

select m.movie, m.category, m.year, m.worldwide_gross,
rank() over(partition by Year order by worldwide_gross desc ) rnk
from marvelmovies m ;

-- Find movies whose Worldwide Gross  is greater than the average gross of movies released 
-- in the same year.

select m1.movie, m1.Worldwide_gross,Year
from marvelmovies m1
where Worldwide_gross >
(select avg(Worldwide_gross)
from marvelmovies m2
where m1.Year = m2.Year) ;

-- Write a CTE to calculate the percentage of the budget recovered (% Budget Recovered) 
-- for each movie and use it to display movies that recovered more than 400% of their budget.

with BudgetRecovery as (
    select 
        movie,
        budget,
        Worldwide_gross,
        (Worldwide_gross / budget) * 100 as BudgetRecoveredPercentage
    from marvelmovies)
select 
    Movie, 
    BudgetRecoveredPercentage
from BudgetRecovery
where BudgetRecoveredPercentage > 400;

-- Write a query to calculate the yearly total, average, minimum, and maximum Worldwide Gross .

select Year,
sum(Worldwide_gross) as Totalworldwidegross,
avg(Worldwide_gross) as averageworldwidegross,
min(Worldwide_gross) as minimumgross,
max(Worldwide_gross ) as maximumgross
from marvelmovies
group by year ;

 -- Write a recursive CTE to simulate year-over-year cumulative gross revenue for movies
-- released after 2010.

with recursive CumulativeGross as (
    select 
        Year,
        SUM(Worldwide_gross) as YearlyGross
    from  marvelmovies
    where Year > 2010
    group by Year
    having Year = 2011
    union all
    select 
        m.Year,
        cg.YearlyGross + m.Worldwide_gross
    from marvelmovies m
    join CumulativeGross cg on m.Year = cg.Year + 1
    where m.Year > 2011
)
select 
    Year,
    YearlyGross
from CumulativeGross;
