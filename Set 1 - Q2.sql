--Which countries have most invoices?

SELECT billing_country, COUNT(total) as total
FROM invoice
GROUP BY billing_country
ORDER BY total DESC
