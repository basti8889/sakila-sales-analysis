-- Pregunta: ¿Qué categorías de películas generan más ingresos?

SELECT  
       c.name AS category,
        SUM(p.amount) AS total_revenue
FROM sakila.payment AS p
JOIN sakila.rental AS r
ON p.rental_id = r.rental_id
JOIN sakila.inventory AS i
ON i.inventory_id = r.inventory_id
JOIN sakila.film AS f
ON i.film_id = f.film_id
JOIN sakila.film_category AS fc
ON f.film_id = fc.film_id 
JOIN sakila.category AS c
ON fc.category_id = c.category_id
GROUP BY c.category_id
ORDER BY total_revenue desc
