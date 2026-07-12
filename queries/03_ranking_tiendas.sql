--  ranking de tiendas por ingresos, con el porcentaje que representa cada una sobre el total


WITH totalIngresos AS (
SELECT
SUM(p.amount) AS ingresos,
s.store_id
FROM sakila.payment AS p
JOIN sakila.rental AS r
ON p.rental_id = r.rental_id
JOIN sakila.inventory AS i
ON i.inventory_id = r.inventory_id
JOIN sakila.store AS s
ON s.store_id = i.store_id
group by s.store_id
)

SELECT
store_id, 
ROUND(ingresos / sum(ingresos) OVER ()* 100,2) AS Porcentaje, 
RANK() OVER (ORDER BY ingresos desc) AS Ranking 
FROM totalIngresos
