use sakila;

SELECT title, special_features FROM film WHERE rating = 'PG-13';

SELECT DISTINCT length FROM film;

SELECT title, rental_rate, replacement_cost FROM film WHERE replacement_cost BETWEEN 20.00 AND 24.00;

SELECT f.title, c.name AS category, f.rating 
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE 'Behind the Scenes' = ANY(f.special_features);

SELECT a.first_name, a.last_name 
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'ZOOLANDER FICTION';

SELECT a.address, c.city, co.country 
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
WHERE s.store_id = 1;

SELECT f1.title AS film1, f2.title AS film2, f1.rating 
FROM film f1
JOIN film f2 ON f1.film_id < f2.film_id AND f1.rating = f2.rating;

SELECT f.title, m.first_name, m.last_name
FROM inventory i
JOIN film f ON i.film_id = f.film_id
JOIN store s ON i.store_id = s.store_id
JOIN staff m ON s.manager_staff_id = m.staff_id
WHERE i.store_id = 2;
