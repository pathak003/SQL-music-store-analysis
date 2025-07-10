--Find how much amount spent by each customers on artist?
--Write a query to return customer name, artist name and total spent.


SELECT customer.customer_id,customer.first_name, customer.last_name, artist.name,
SUM(invoice_line.unit_price * invoice_line.quantity) as total
FROM customer
JOIN invoice 
ON customer.customer_id = invoice.customer_id
JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
JOIN track
ON invoice_line.track_id = track.track_id
JOIN album
ON track.album_id = album.album_id
JOIN artist
ON album.artist_id = artist.artist_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name, artist.name
ORDER BY total DESC
