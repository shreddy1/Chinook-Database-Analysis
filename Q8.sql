-- Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how much they spent. 
-- For countries where the top amount spent is shared, provide all customers who spent this amount.



WITH TotalsPerCountry AS
(
		SELECT i.BillingCountry, c.FirstName || ' ' || c.LastName AS CustomerName, sum(i.Total) AS TotalSpent
		FROM Invoice i
		JOIN Customer c ON c.CustomerId=i.CustomerId
		GROUP BY i.BillingCountry, c.CustomerId
		ORDER BY i.BillingCountry
)               

SELECT t.BillingCountry, t.CustomerName, t.TotalSpent
FROM  TotalsPerCountry t
WHERE t.TotalSpent = (	SELECT max(TotalSpent) 
										FROM TotalsPerCountry
										WHERE t.BillingCountry=BillingCountry
										GROUP BY BillingCountry 
									 )