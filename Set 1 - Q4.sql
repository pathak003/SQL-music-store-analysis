--Which city has best customers?
--We would like to throw a promotional muscic festival in city we made most money.
--Write a  query that returns one city that has highest sum of invoices total.
--Return both city name and sum of all invoices total.


SELECT billing_city, SUM(total) as total
FROM invoice
GROUP BY billing_city
ORDER BY total
LIMIT 1