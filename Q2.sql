-- Which city has the best customers?

SELECT BillingCity AS City, sum(Total) AS InvoiceTotals
FROM Invoice
GROUP BY BillingCity
ORDER BY InvoiceTotals DESC
LIMIT 1;