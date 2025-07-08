--Return all the track names that have a song length longer than the average song length.
--Order by the song length with longest song listed first.

SELECT name, milliseconds 
FROM track
WHERE milliseconds >(
 SELECT AVG(milliseconds) from track)
ORDER BY milliseconds DESC
 


