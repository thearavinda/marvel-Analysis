 use marvelmovies;
 select * from marvelmovies ; 
 
 -- 1.Write a query to find movies where the Audience vs Critics % Deviance is greater than 10% and 
-- the Worldwide Gross ($m) exceeds 1000.

select movie, audience_vs_criticsdeviance, worldwide_gross
from marvelmovies
where abs( audience_vs_criticsdeviance) > 10
and  worldwide_gross > 1000 ;

-- 2.Write a query to find pairs of movies released in the same year, where the first movie (Movie1)
-- has a higher Worldwide Gross ($m) than the second movie (Movie2)..

select m1.movie, m1.year, m1.worldwide_gross, m2.movie, m2.worldwide_gross, m2.year
from marvelmovies m1
join marvelmovies m2
on m1.year = m2.year
where m1.worldwide_gross >m2.worldwide_gross ;

-- 3.Write a query to calculate the percentage of the Worldwide Gross that comes from the Domestic Gross
-- for each movie.

select movie,(domesticgross/worldwide_gross) * 100 as domesticgrosspercentage
from marvelmovies ;

-- 4.Write a query to find the average Budget ($m) for movies with a Critics % Score below 80%.

select avg(budget) as averagebudget
from marvelmovies
where critics_score < 80 ;

-- 5.Write a query to find movies whose Worldwide Gross is higher than the average gross of all movies.

select movie, worldwide_gross
from marvelmovies
where worldwide_gross >
(select avg(worldwide_gross)
from marvelmovies) ;

-- 6.Find movies released after 2015 with an opening weekend revenue of more than $100 million 
-- or a second weekend drop-off less than 50%.

select movie, year, opening_weekend, first_vs_second_weekenddrop as weekenddrop
from marvelmovies
where year > 2015
and (opening_weekend > 100 or first_vs_second_weekenddrop < 50) ;

-- 7.Write a query to create a column labeled Performance that categorizes movies as:
    -- "Blockbuster" if Worldwide Gross ($m) > 1000.
    -- "Hit" if between 500 and 1000.
	-- "Average" otherwise.

select movie, worldwide_gross,
case 
   when worldwide_gross > 1000 then 'Blockbuster'
   when worldwide_gross between 500 and 1000 then 'Hit'
   else 'Average'
   end as Performance
   from marvelmovies ;

