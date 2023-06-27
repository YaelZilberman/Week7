use sakila;
SELECT a1.actor_id AS actor1_id, a1.first_name AS actor1_first_name, a1.last_name AS actor1_last_name,
       a2.actor_id AS actor2_id, a2.first_name AS actor2_first_name, a2.last_name AS actor2_last_name
FROM actor a1
JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id
WHERE a1.actor_id < a2.actor_id
ORDER BY a1.actor_id, a2.actor_id; -- Get all pairs of actors that worked together.
SELECT c1.customer_id AS customer1_id, c1.first_name AS customer1_first_name, c1.last_name AS customer1_last_name,
       c2.customer_id AS customer2_id, c2.first_name AS customer2_first_name, c2.last_name AS customer2_last_name,
       f.film_id, f.title, COUNT(*) AS rental_count
FROM customer c1
JOIN rental r1 ON c1.customer_id = r1.customer_id
JOIN inventory i1 ON r1.inventory_id = i1.inventory_id
JOIN film f ON i1.film_id = f.film_id
JOIN inventory i2 ON f.film_id = i2.film_id
JOIN rental r2 ON i2.inventory_id = r2.inventory_id
JOIN customer c2 ON r2.customer_id = c2.customer_id
WHERE c1.customer_id < c2.customer_id
GROUP BY c1.customer_id, c1.first_name, c1.last_name, c2.customer_id, c2.first_name, c2.last_name, f.film_id, f.title
HAVING COUNT(*) > 3
ORDER BY rental_count DESC; -- Get all pairs of customers that have rented the same film more than 3 times.
SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title
FROM actor a
CROSS JOIN film f
JOIN film_actor fa ON a.actor_id = fa.actor_id AND f.film_id = fa.film_id; -- Get all possible pairs of actors and films.