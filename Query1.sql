-- Query 1: Top 10 Countries who purchased Metal Genre

SELECT
  i.BillingCountry Country,
  COUNT(*) MetalGenre_Purchased
FROM Invoice i
JOIN InvoiceLine iL
  ON i.InvoiceId = iL.InvoiceId
JOIN Track t
  ON iL.TrackId = t.TrackId
JOIN Genre g
  ON t.GenreId = g.Genreid
WHERE g.Name = 'Metal'
GROUP BY i.BillingCountry
ORDER BY MetalGenre_Purchased DESC, i.BillingCountry
LIMIT 10;