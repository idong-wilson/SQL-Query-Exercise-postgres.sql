--"Hello World" of sgl - SELECT all records from a table
SELECT * -- * means all columns
from actor;


-- Query specific columnns - SELECT column_name, ... FROM table_name
select first_name, last_name
from actor;


-- Get all rows and columns from the film table
select *
from film


-- Filter rows - use the WHERE clause - always comes after the FROM 
select *
from actor
where first_name = 'Nick';


-- using the LIKE operator
SELECT *
FROM actor 
WHERE first_name LIKE 'Nick'

-- using the LIKE operator with % acts as a wildcard - can be any number of characters(0 - infinity)
select *
from actor 
WHERE first_name LIKE 'J%'; -- RETURN ANY record that has a first_name that starts with J


-- using the LIKE with _-_ acts as a wildcard for 1 and only 1 character 
select *
from actor
where first_name like '_i_';  -- ANY record that has a firat_name of 3 letters with the 2nd letter being an i


-- comparing operators in SQL
-- Greater then (>) - less than (<)
--Greater than or equal (>+) -- Less than or equal (<=)
-- Equal (=) -- Not Equal (<>)

-- Explore data or new table with SELECT *
SELECT *
FROM payment;

-- Get all the payments between $3 and $8 (inclusive)
select *
from payment
where amount >= 3 and <= 8;

-- Between / And clause
select *
from payment
where amount BETWEEN3 and 8;

-- order our rows of data by using the ORDER
select *
from payment
where amount >= 3 and 8
ORDER BY payment_date;

-- to order in descending order, use order by clause + DESC
select *
from payment
where amount >= 3 and 8
ORDER BY amount DESC;

-- order by strings - alphabetical
select *
from payment
ORDER BY last_name;


-- SQL aggregations => SUM90, AVG(), COUNT(), MIN(), MAX()
-- takes in a column_name as an argument and returns a VALUE

-- Get the sum of all the payments
SELECT SUM(amount)
FROM payment;

-- Get the sum of all payments of more than $5
SELECT(amount)
FROM payment
WHERE amount > 5


-- GET the count OF ALL payments OF MORE than $5
SELECT COUNT(*)
FROM payment
WHERE amount > 5

-- get min and max of payments - also lias the column name
SELECT MIN(amount) AS lowest_amount_paid
FROM payment;


-- Calculate a column based on two other columns
SELECT payment_id, rental_id, payment_id - rental_id AS difference
FROM payment;


-- Query the number of payments per amount
SELECT count(*)
FROM payment
WHERE amount = 4.99;

-- Group by clause - used with aggregations
SELECT amount, COUNT(*), SUM(amount), AVG(amount)
FROM payment
GROUP BY  amount;

-- Columns from the table must be used in the group by
SELECT amount, customer_id, COUNT(*)
FROM payment
GROUP BY  amount; -- ERROR, COLUMN "payment.customer_id" must appear IN the GROUP BY clause 


-- Query the payment table to display the customers who have spent mostt(aka order by sum(amount)
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY  customer_id;
ORDER BY sum(amount) DESC; 

-- Alias our aggregation column and use aliased name in order BY 
SELECT acustomer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY  customer_id;
ORDER BY total_spent DESC;


-- Having vclause => Having is to group by/ aggregations as where is to SELECT 
-- Query




-- putting ALL the clauses INTO one query 
-- display customers 11 - 29 who have spent the most in under 20 pqyments and has a customer_id > 350
SELECT acustomer_id, SUM(amount), count(*) 
FROM payment
WHERE customer_id >350
GROUP BY  customer_id
HAVING count)*) < 20
ORDER BY SUM(amount)
OFFSET 10
LIMIT 10;






Question 1. How many actors are there with the last name ‘Wahlberg’?

SELECT count(*)
 FROM actor 
 WHERE last_name = 'Wahlberg';

--There ARE two (2) actors whose LAST name IS 'Wahlberg'


Question 2. How many payments were made between $3.99 and $5.99?

SELECT count(*)
 FROM payment 
 WHERE amount >= 3.99 AND amount <= 5.99;

--There ARE 5607 payments that ARE BETWEEN $3.99 AND $5.99


Question 3. What films have exactly 7 copies? (search in inventory)

SELECT film_id, count(*)
FROM inventory
GROUP by film_id 
HAVING count(*) = 7;

--There IS NO 'inventory' OR 'copies' COLUMN TO calculate FROM


Question 4. How many customers have the first name ‘Willie’?

SELECT count(*)
FROM customer
WHERE first_name = 'Willie';

--There ARE two customers WITH the FIRST name 'Willie'


Question 5. What store employee (get the id) sold the most rentals (use the rental table)?

SELECT count(rental_id), staff_id
FROM rental r GROUP BY staff_id ORDER BY count(rental_id) DESC;

Store_id 1 has the highest rentals


Question 6. How many unique district names are there?

SELECT count(DISTINCT(district))
FROM address; 

There ARE 378 distict districts


Question 7. What film has the most actors in it? (use film_actor table and get film_id)


SELECT fil_id, count(actor_id)
FROM film_actor
GROUP BY film_id ORDER BY count(actor_id) DESC;


Question 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT count(*)
FROM customer c
WHERE last_name LIKE '%es'AND store_id = 1;

13 customers


-- Question 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)

SELECT amount, count(customer_id)
FROM payment p
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING count(customer_id) >= 250;

281



-- Question 10. Within the film table, how many rating categories are there? And what rating has the most movies total?

SELECT DISTINCT rating, count(film_id)
FROM film 
GROUP BY rating 
ORDER BY count(film_id) desc; 

5 rating categories
PG-13 has the highest movie total









