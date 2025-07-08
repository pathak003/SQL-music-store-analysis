--Let's invite the artist who have written the most rock music in our dataset.
--Write a query that return the artist name and total track count of top 10 rock bands.


SELECT artist.name, artist.artist_id, count(artist.artist_id) as numbers_of_songs
FROM artist
JOIN album ON album.artist_id = artist.artist_id
JOIN track ON track.album_id = album.album_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY numbers_of_songs DESC
LIMIT 10

