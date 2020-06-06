-- Who is the best customer?

SELECT  FirstName, LastName, sum(i.Total) AS TotalSpent
FROM Customer c, Invoice i
WHERE c.CustomerId=i.CustomerId
GROUP BY (i.CustomerId)
ORDER BY TotalSpent DESC
LIMIT 1;