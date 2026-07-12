-- Pregunta de negocio: ¿Cómo evolucionan los ingresos mes a mes? ¿Hay estacionalidad?

SELECT 
ROUND(SUM(amount)) AS ingresos, 
DATE_FORMAT(payment_date,'%Y-%m') AS Mes
FROM sakila.payment
GROUP BY mes 
ORDER BY mes desc


