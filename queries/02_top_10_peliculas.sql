-- Pregunta de negocio: ¿Cuáles son las 10 películas más rentables?
SELECT  
     f.title AS TITLE,
     SUM(p.amount) AS total_revenue
FROM sakila.payment AS p
   JOIN sakila.rental AS r
    ON p.rental_id = r.rental_id
    JOIN sakila.inventory AS i
    ON i.inventory_id = r.inventory_id
    JOIN sakila.film AS f
    ON i.film_id = f.film_id
    GROUP BY f.film_id
    ORDER BY total_revenue desc
    limit 10;	
