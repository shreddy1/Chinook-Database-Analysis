-- Query 4: Best-selling artists

SELECT
  a.Name AS Name,
  SUM(iL.Quantity * iL.UnitPrice) AS AmountSpent
FROM Artist a
JOIN Album ab
  ON a.ArtistId = ab.ArtistId
JOIN Track t
  ON t.AlbumId = ab.AlbumId
JOIN InvoiceLine iL
  ON t.TrackId = iL.Trackid
GROUP BY a.Name
ORDER BY AmountSpent DESC
Limit 5;