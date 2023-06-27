use sakila;
SELECT s.store_id, ci.city, co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id; -- Write a query to display for each store its store ID, city, and country.
SELECT s.store_id, c.city, SUM(p.amount) AS total_sales
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN staff sf ON s.store_id = sf.store_id
JOIN payment p ON sf.staff_id = p.staff_id
GROUP BY s.store_id, c.city; -- Write a query to display how much business, in dollars, each store brought in.
SELECT c.category_id, c.name AS category, AVG(f.length) AS average_time
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name; -- What is the average running time of films by category
SELECT c.category_id, c.name AS category, AVG(f.length) AS average_time
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name ORDER BY average_time DESC; -- Which film categories are longest?
SELECT f.film_id, f.title, COUNT(*) AS rent_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rent_count DESC; -- Display the most frequently rented movies in descending order.
SELECT c.category_id, c.name AS genre, SUM(p.amount) AS revenue
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.category_id, c.name
ORDER BY revenue DESC
LIMIT 5; -- List the top five genres in gross revenue in descending order.
SELECT f.film_id, f.title, s.store_id, i.inventory_id
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN store s ON i.store_id = s.store_id
WHERE f.title = 'Academy Dinosaur' AND s.store_id = 1; -- how to check if academy dinosaur is available