--find out the most popular music Genre for each country. 
-- We determine the most popular genre as the genre with the highest amount of purchases. 
-- Write a query that returns each country along with the top Genre. 
-- For countries where the maximum number of purchases is shared return all Genres.

WITH Country_Purchases_List AS
(SELECT count(*) AS Purchases, g.Name AS Name, i.BillingCountry AS Country
FROM 	InvoiceLine iL
		JOIN Track t ON t.TrackId=iL.TrackId
		JOIN Genre g ON g.GenreId=t.GenreId
		JOIN Invoice i ON iL.InvoiceId=i.InvoiceId
GROUP BY Country, g.GenreId)

SELECT cpl.Country, cpl.Name, cpl.Purchases 
FROM Country_Purchases_List cpl
WHERE 	cpl.Purchases = (SELECT 	max(Purchases) FROM Country_Purchases_List 
									WHERE cpl.Country=Country
									GROUP BY Country
									)
ORDER BY Country;