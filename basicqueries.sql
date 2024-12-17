create database marvelmovies;
use marvelmovies ;

CREATE TABLE MarvelMovies (
    movie VARCHAR(100),
    category VARCHAR(50),
    year INT,
    worldwide_gross INT,
    budget_recovered VARCHAR(10),
    critics_score VARCHAR(10),
    audience_score_percentage VARCHAR(10),
    audience_vs_criticsdeviance VARCHAR(10),
    budget FLOAT,
    domesticgross INT,
    internationalgross INT,
    opening_weekend FLOAT,
    second_weekend FLOAT,
    first_vs_second_weekenddrop VARCHAR(10),
    gross_from_opening_percentage FLOAT,
    gross_from_domestic_percentage VARCHAR(10),
    gross_from_international_percentage VARCHAR(10),
    budget_opening_weekend_percentage VARCHAR(10)
);

select * from marvelmovies ;

#Basic Questions

-- 1.Write a query to display Category, Year, and Worldwide Gross for all movies.

select Category, Year, Worldwide_gross
from marvelmovies ;

-- 2.Write a query to find movies released after 2018.

select movie, year 
from marvelmovies
where year > 2018 ;

-- 3.Write a query to sort the movies by their Worldwide Gross in descending order.

select movie, Category, worldwide_gross
from marvelmovies
order by worldwide_gross desc ;

-- 4.How many movies are in the dataset?

select count(movie) as numberofmovies
from marvelmovies ;

-- 5.Write a query to calculate the total Worldwide Gross for all movies.

select sum(worldwide_gross) as Total_Worldwide_gross
from marvelmovies ;

-- 6.Write a query to display movies with a Critics % Score greater than 90%.

select movie, critics_score
from marvelmovies
where critics_score > 90 ;

-- 7.Group movies by Year and find the total Worldwide Gross for each year.

select  Year, sum(worldwide_gross) as Total_Worldwide_gross
from marvelmovies
group by year 
order by year ;

-- 8.Group movies by Category and find the total Worldwide Gross.

select Category, sum(worldwide_gross) as Total_Worldwide_gross
from marvelmovies
group by Category ;
 
 