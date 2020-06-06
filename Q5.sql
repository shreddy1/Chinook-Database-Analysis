--find which artist has earned the most according to the InvoiceLines?
-- Use the above information to find artist to find which customer spent the most on this artist.


WITH BestSellingArtist AS
(
SELECT sum(iL.UnitPrice * iL.Quantity) AS 'ArtistTotal', a.Name AS 'ArtistName', a.ArtistId
FROM InvoiceLine iL, Track T, Album ab, Artist a
WHERE iL.TrackId=t.TrackId AND
ab.AlbumId=t.AlbumId AND
a.ArtistId=ab.ArtistId
GROUP BY a.ArtistId
ORDER BY ArtistTotal DESC
LIMIT 1
)

SELECT 	bsa.ArtistName,
		bsa.ArtistTotal,
		c.CustomerId    AS 'CustomerId',
		c.FirstName, c.LastName,
		SUM(iL.Quantity*iL.UnitPrice) AS 'CustomerTotal'
FROM 	Artist a 
		JOIN Album ab ON a.ArtistId = ab.ArtistId 
		JOIN Track t ON t.AlbumId = ab.AlbumId 
		JOIN InvoiceLine iL ON t.TrackId = iL.Trackid 
		JOIN Invoice i ON iL.InvoiceId = i.InvoiceId 
		JOIN Customer c ON c.CustomerId = i.CustomerId 
		JOIN BestSellingArtist bsa ON bsa.ArtistId = a.ArtistId
GROUP BY c.CustomerId 
ORDER BY CustomerTotal DESC
limit 1;