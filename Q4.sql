-- Use your query to return the email, first name, last name, and Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email address starting with A.

SELECT distinct c.email AS Email, c.FirstName AS First_Name, c.LastName AS Last_Name, g.name AS Name
FROM Genre g, Track t, InvoiceLine iL, Invoice i, Customer c
WHERE g.name='Rock' AND
g.GenreId=t.GenreId AND
t.TrackId=iL.TrackId AND
iL.InvoiceId=i.InvoiceId AND
i.CustomerId=c.CustomerId
ORDER BY Email;