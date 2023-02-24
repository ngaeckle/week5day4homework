-- List all customers who live in Texas (use JOINs)
SELECT first_name, last_name
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE a.district = 'Texas'

-- Get all payments above $6.99 with the Customer's Full Name
SELECT amount, first_name, last_name
FROM customer c
JOIN payment p
ON p.customer_id = c.customer_id
WHERE p.amount > 6.99;

-- Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer c
WHERE 175 < (
	SELECT sum(amount)
	FROM payment p
);


-- List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, c3.country
FROM customer c
JOIN address a
ON c.address_id = a.address_id
JOIN city c2
ON c2.city_id = a.city_id
JOIN country c3
ON c2.country_id = c3.country_id
WHERE c3.country = 'Nepal';

-- Which staff member had the most transactions?
SELECT count(*), first_name, last_name
FROM staff s
JOIN payment p
ON s.staff_id = p.staff_id
GROUP BY first_name, last_name
ORDER BY count(*) DESC; 


-- How many movies of each rating are there?
SELECT count(rating), f.rating
FROM film f
GROUP BY rating;

-- Show all customers who have made a single payment above $6.99 
--(Use Subqueries)
SELECT first_name, last_name
FROM customer c
WHERE 6.99 < (
	SELECT sum(amount)
	FROM payment p
)
GROUP BY c.customer_id; 


-- How many free rentals did our store give away?
SELECT count(*)
FROM payment
WHERE amount = 0
