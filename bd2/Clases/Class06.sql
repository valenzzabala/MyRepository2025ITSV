
-- 1. List all the actors that share the last name. Show them in order
SELECT first_name, last_name FROM actor WHERE last_name IN (SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*) > 1) ORDER BY last_name, first_name;

-- 2. Find actors that don't work in any film
SELECT actor_id, first_name, last_name FROM actor WHERE actor_id NOT IN (SELECT DISTINCT actor_id FROM film_actor);

-- 3. Find customers that rented only one film
SELECT customer_id FROM rental GROUP BY customer_id HAVING COUNT(DISTINCT inventory_id) = 1;

-- 4. Find customers that rented more than one film
SELECT customer_id FROM rental GROUP BY customer_id HAVING COUNT(DISTINCT inventory_id) > 1;

-- 5. List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'
SELECT DISTINCT a.actor_id, a.first_name, a.last_name FROM actor a JOIN film_actor fa ON a.actor_id = fa.actor_id JOIN film f ON fa.film_id = f.film_id WHERE f.title IN ('BETRAYED REAR', 'CATCH AMISTAD');

-- 6. List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'
SELECT DISTINCT a.actor_id, a.first_name, a.last_name FROM actor a JOIN film_actor fa ON a.actor_id = fa.actor_id JOIN film f ON fa.film_id = f.film_id WHERE f.title = 'BETRAYED REAR' AND a.actor_id NOT IN (SELECT fa.actor_id FROM film_actor fa JOIN film f ON fa.film_id = f.film_id WHERE f.title = 'CATCH AMISTAD');

-- 7. List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'
SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.actor_id IN (SELECT fa.actor_id FROM film_actor fa JOIN film f ON fa.film_id = f.film_id WHERE f.title = 'BETRAYED REAR') AND a.actor_id IN (SELECT fa.actor_id FROM film_actor fa JOIN film f ON fa.film_id = f.film_id WHERE f.title = 'CATCH AMISTAD');

-- 8. List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'
SELECT a.actor_id, a.first_name, a.last_name FROM actor a WHERE a.actor_id NOT IN (SELECT fa.actor_id FROM film_actor fa JOIN film f ON fa.film_id = f.film_id WHERE f.title IN ('BETRAYED REAR', 'CATCH AMISTAD'));
