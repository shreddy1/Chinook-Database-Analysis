-- Query 3: Top 10 bands

SELECT
  a.Name AS ArtistName,
  COUNT(*) AS Songs
FROM Artist a,
     Album ab,
     Track t,
     Genre g
WHERE a.ArtistId = ab.ArtistId
AND t.AlbumId = ab.AlbumId
AND g.GenreId = t.GenreId
AND g.Name = 'Rock'
GROUP BY a.ArtistId
ORDER BY Songs DESC
LIMIT 10;