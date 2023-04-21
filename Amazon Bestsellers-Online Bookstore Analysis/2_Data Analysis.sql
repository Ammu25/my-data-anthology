/* Create a table schema in the database */
create table amazonbooks (
	book_name varchar(300),
	author varchar(100),
	user_rating decimal,
	reviews integer,
	price_in_$ integer, 	
	year integer,
	genre varchar(50)
	);

/* Import data from CSV file */

/* Check for null values in each column in the table */
select * from amazonbooks
where book_name is null;

select * from amazonbooks
where author is null;

select * from amazonbooks
where user_rating is null;

select * from amazonbooks
where reviews is null;

select * from amazonbooks
where price_in_$ is null;

select * from amazonbooks
where year is null;

select * from amazonbooks
where genre is null;

/* Result: There are no null values */

/* Perform data analysis */

/* FICTION */

/* Top rated most popular books based on user reviews*/
select book_name,
max(reviews)
from amazonbooks
where genre = 'Fiction' and user_rating = (select max(user_rating)
						  from amazonbooks)
group by book_name 
order by 
max(reviews) desc;

/* Details of the above top rated most popular books based on user reviews - table data */

select book_name, author, price_in_$, year from
(select book_name, author, price_in_$, year, max(reviews)
from amazonbooks
where genre = 'Fiction' and user_rating = (select max(user_rating)
						  from amazonbooks)
group by book_name, author, price_in_$, year
order by 
max(reviews) desc) as fic_table;


/* NON FICTION */

/* Top rated most popular books based on user reviews - bar chart */
select book_name, max(reviews)
from amazonbooks
where genre = 'Non Fiction' and user_rating = (select max(user_rating)
						  from amazonbooks)
group by book_name
order by 
max(reviews) desc;

/* Details of the above top rated most popular books based on user reviews - table data */

select book_name, author, price_in_$, year from
(select book_name, author, price_in_$, year, max(reviews)
from amazonbooks
where genre = 'Non Fiction' and user_rating = (select max(user_rating)
						  from amazonbooks)
group by book_name, author, price_in_$, year
order by 
max(reviews) desc) as nonfic_table;
