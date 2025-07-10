--Write a query that determine the customer that has spent most on music for each country.
--Write a query that return the country along with the top customer and how much they spent. 
--For countries where top amount spent is shared, provide all customer who spent this amount.

WITH RECURSIVE
    customer_with_country AS(
 SELECT customer.customer_id,customer.first_name, customer.last_name, invoice.billing_country, SUM(invoice.total) AS total_spending
 FROM customer
 JOIN invoice
 ON customer.customer_id = invoice.customer_id
 GROUP BY customer.first_name, customer.last_name, invoice.billing_country,customer.customer_id
 ORDER BY customer.customer_id,total_spending  DESC),

 country_max_spending AS(
  SELECT billing_country, MAX(total_spending) AS max_spending
  FROM customer_with_country
  GROUP BY billing_country)
 
 SELECT cc.billing_country, cc.first_name, cc.last_name, cc.customer_id,cc.total_spending
 FROM customer_with_country cc
 JOIN country_max_spending ms
 ON cc.billing_country = ms.billing_country
 WHERE cc.total_spending = ms.max_spending
 ORDER BY 1
 