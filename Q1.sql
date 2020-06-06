-- Which countries have the most Invoices?

SELECT BillingCountry, count(*) AS Invoices 
FROM Invoice
GROUP BY BillingCountry
ORDER BY Invoices DESC;