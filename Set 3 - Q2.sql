--We want to find out most popular music genre for each country.
--We determine the most popular genre as the genre with highest amount of purhases.
--write a query that returns each country along with the top genre.

WITH popular_genre AS
(
 SELECT COUNT(invoice_line.quantity) AS purchases, customer.country, genre.name, genre.genre_id,
 ROW_NUMBER() OVER (PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity)DESC) AS RowNO
 FROM invoice_line
 JOIN invoice
 ON invoice_line.invoice_id = invoice.invoice_id
 JOIN customer
 ON customer.customer_id = invoice.customer_id
 JOIN track
 ON track.track_id = invoice_line.track_id
 JOIN genre ON genre.genre_id = track.genre_id
 GROUP BY 2,3,4
 ORDER BY 2 ASC, 1 DESC
)
SELECT * FROM popular_genre WHERE ROwNO <=1