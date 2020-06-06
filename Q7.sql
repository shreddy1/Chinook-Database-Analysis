-- Return all the track names that have a song length longer than the average song length.
-- Return the Name and Milliseconds for each track. 
-- Order by the song length with the longest songs listed first.

SELECT t.Name, t.Milliseconds
FROM Track t
WHERE t.Milliseconds > 	( 	SELECT AVG(Milliseconds) 
								FROM  Track)
ORDER BY t.Milliseconds DESC;