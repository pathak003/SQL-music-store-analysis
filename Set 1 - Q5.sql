--Who is the best customer? 
--The customer who has spent the most money will be declared as the best customer.
--Write a query that return the person who has spent most money.

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total 
FROM customer
JOIN invoice
ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1