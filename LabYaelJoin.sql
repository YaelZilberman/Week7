use sakila;
SELECT count(film_id) AS film_amount, category_id
FROM film_category GROUP BY category_id; -- how many films per category
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s JOIN address a ON s.address_id = a.address_id; -- address of each staff member with first and last names
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
JOIN rental r ON p.rental_id = r.rental_id
WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8
GROUP BY s.staff_id, s.first_name, s.last_name; -- Display the total amount rung up by each staff member in August 2005.
SELECT f.film_id, f.title, COUNT(*) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title; -- List all films and the number of actors who are listed for each film.
SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.last_name, c.first_name
ORDER BY c.last_name; -- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.