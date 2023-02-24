--1. List all customers who live in Texas (use JOINs)
SELECT *
FROM customer c 
JOIN address a 
ON a.address_id = c.address_id 
WHERE district = 'Texas'; 


--2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount 
FROM customer c 
JOIN payment p
ON p.customer_id = c.customer_id 
WHERE amount > 6.99;


--3. Show all customers names who have made payments over $175(use subqueries)
SELECT customer_id, first_name, last_name
FROM customer c 
WHERE customer_id IN (
	    			  SELECT customer_id
	    			  FROM payment p
	    			  GROUP BY customer_id 
	    			  HAVING sum (amount) > 175);
	    			 
--4. List all customers that live in Nepal (use the city table)
SELECT * 
FROM customer c 
JOIN address a 
ON a.address_id = c.address_id 
JOIN city c2 
ON c2.city_id = a.city_id 
FULL OUTER JOIN country c3 
ON c3.country_id = c2.country_id 
WHERE country = 'Nepal';


--5. Which staff member had the most transactions?
SELECT s.staff_id, first_name , last_name , count(*) AS most_transaction  
FROM staff s 
JOIN payment p 
ON p.staff_id = s.staff_id 
GROUP BY s.staff_id 
ORDER BY most_transaction DESC 
LIMIT 1;


--6. How many movies of each rating are there?
SELECT rating, count(*) AS total_movies
FROM film 
GROUP BY rating; 


--7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT *
FROM customer 
WHERE customer_id IN (
					  SELECT customer_id 
					  FROM payment 
					  WHERE amount > 6.99
					  GROUP BY customer_id
					  HAVING count(*) = 1);


--8. How many free rentals did our stores giveaway ?
SELECT count(*)
FROM payment 
WHERE amount = 0;

--OR to see those free rental records
SELECT *
FROM rental r 
JOIN payment p 
ON r.rental_id = p.rental_id 
WHERE amount = 0 ;







