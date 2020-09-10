--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
--SELECT
--c.CustomerId, c.FirstName+ ' ' + c.LastName AS "Full Name", c.Country
--FROM Customer c
--WHERE c.Country != 'USA';

--brazil_customers.sql: Provide a query only showing the Customers from Brazil.
--SELECT c.CustomerId, c.FirstName+ ' ' + c.LastName AS "Full Name", c.Country
--FROM Customer c
--WHERE c.Country = 'Brazil';

--brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
--SELECT
--c.FirstName + ' ' + c.LastName AS "Full Name",
--i.InvoiceId, i.InvoiceDate, i.BillingCountry
--FROM Customer c
--JOIN Invoice i ON c.CustomerId = i.CustomerId
--WHERE c.Country = 'Brazil';

--sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
--SELECT * FROM Employee WHERE Title LIKE '%Sales%' AND Title LIKE '%Agent%'

--unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
--SELECT DISTINCT i.BillingCountry
--FROM Invoice i
--ORDER BY i.BillingCountry;

--sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
--SELECT
--e.LastName + ', ' + e.FirstName AS 'Sales Agent',
--i.InvoiceId, i.InvoiceDate, i.BillingAddress, i.BillingCity, i.BillingState, i.BillingCountry, i.BillingPostalCode, i.Total
--FROM
--Employee e
--JOIN Customer c ON e.EmployeeId = c.SupportRepId
--JOIN Invoice i ON c.CustomerId = i.CustomerId
--ORDER BY e.LastName;

--invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

--SELECT i.Total,
--c.FirstName + ' ' + c.LastName AS 'Customer Name',
--i.BillingCountry AS 'Country',
--sa.FirstName + ' ' + sa.LastName AS 'Sales Agent'
--FROM Invoice i
--JOIN Customer c ON i.CustomerId = c.CustomerId
--JOIN Employee sa ON c.SupportRepId = sa.EmployeeId;

--total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?

--SELECT COUNT(InvoiceId) FROM Invoice WHERE InvoiceDate LIKE '%2009%' OR InvoiceDate LIKE '%2011%';

--total_sales_{year}.sql: What are the respective total sales for each of those years?

--SELECT '2009' AS 'Year', SUM(Total) AS 'Invoice Total' FROM Invoice  WHERE InvoiceDate LIKE '%2009%'
--UNION
--SELECT '2011', SUM(Total) FROM Invoice  WHERE InvoiceDate LIKE '%2011%'


--invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
--SELECT Count(InvoiceLineId) AS 'Number of Invoice Line Items' FROM InvoiceLine il JOIN Invoice i ON il.InvoiceId = i.InvoiceId WHERE i.InvoiceId=37


--line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
--SELECT i.InvoiceId AS 'Invoice Id', Count(InvoiceLineId) AS 'Number of Items' FROM InvoiceLine il JOIN Invoice i ON il.InvoiceId = i.InvoiceId GROUP BY i.InvoiceId


--line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.
--SELECT
--	il.InvoiceLineId AS 'Invoice Line Item',
--	t.Name
--FROM InvoiceLine il
--JOIN Track t ON il.TrackId = t.TrackId ORDER BY il.InvoiceLineId;


--line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.
--SELECT
--	il.InvoiceLineId AS 'Invoice Line Item',
--	t.Name AS 'Track',
--	ar.Name AS 'Artist'
--FROM InvoiceLine il
--JOIN Track t ON il.TrackId = t.TrackId
--JOIN Album al ON t.AlbumId = al.AlbumId
--JOIN Artist ar ON al.ArtistId = ar.ArtistId
--ORDER BY il.InvoiceLineId;

--country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY
--SELECT
--	i.BillingCountry AS 'Country',
--	COUNT(i.InvoiceId) AS 'Number of Invoices'
--FROM Invoice i
--GROUP BY i.BillingCountry;


--playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.
--SELECT
--	p.Name AS 'Playlist Name',
--	COUNT(pt.TrackId) AS 'Number of Tracks'
--FROM Playlist p
--JOIN PlaylistTrack pt ON p.PlaylistId = pt.PlaylistId
--GROUP BY p.Name;

--tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
--SELECT
--	t.Name,
--	al.Title AS 'Album',
--	m.Name AS 'Media Type',
--	g.Name AS 'Genre'
--FROM Track t
--JOIN Album al ON t.AlbumId = al.AlbumId
--JOIN MediaType m ON t.MediaTypeId = m.MediaTypeId
--JOIN Genre g ON t.GenreId = g.GenreId;

--invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.
--SELECT
--	i.InvoiceId,
--	i.InvoiceDate,
--	i.BillingAddress, i.BillingCity, i.BillingState, i.BillingCountry, i.BillingPostalCode, i.Total,
--	COUNT(il.InvoiceLineId) AS 'Number of Line Items'
--FROM Invoice i
--JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
--GROUP BY i.InvoiceId, i.InvoiceDate, i.BillingAddress, i.BillingCity, i.BillingState, i.BillingCountry, i.BillingPostalCode, i.Total

--sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.
--SELECT
--	e.FirstName +' '+e.LastName AS 'Sales Agent',
--	SUM(i.Total) AS 'Total Sales'
--FROM Employee e
--JOIN Customer c ON e.EmployeeId = c.SupportRepId
--JOIN Invoice i ON c.CustomerId = i.CustomerId
--GROUP BY e.EmployeeId, e.FirstName, e.LastName;

--top_2009_agent.sql: Which sales agent made the most in sales in 2009?
--SELECT
--	TOP 1 e.FirstName +' '+e.LastName AS 'Sales Agent',
--	SUM(i.Total) AS 'Total Sales'
--FROM Employee e
--JOIN Customer c ON e.EmployeeId = c.SupportRepId
--JOIN Invoice i ON c.CustomerId = i.CustomerId
--WHERE i.InvoiceDate LIKE '%2009%'
--GROUP BY e.EmployeeId, e.FirstName, e.LastName
--ORDER BY SUM(i.Total) DESC;




--top_agent.sql: Which sales agent made the most in sales over all?
--SELECT
--	TOP 1 e.FirstName +' '+e.LastName AS 'Sales Agent',
--	SUM(i.Total) AS 'Total Sales'
--FROM Employee e
--JOIN Customer c ON e.EmployeeId = c.SupportRepId
--JOIN Invoice i ON c.CustomerId = i.CustomerId
--GROUP BY e.EmployeeId, e.FirstName, e.LastName
--ORDER BY SUM(i.Total) DESC;


--sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.
--SELECT CONCAT(e.FirstName, ' ', e.LastName) SalesAgent, c.NumberOfCustomers
--FROM Employee e
--LEFT JOIN (
--	SELECT
--		DISTINCT SupportRepId SalesAgentId,
--		COUNT(SupportRepId) NumberOfCustomers
--	FROM Customer
--	GROUP BY SupportRepId
--) c ON c.SalesAgentId = e.EmployeeId

--sales_per_country.sql: Provide a query that shows the total sales per country.
--SELECT BillingCountry Country, SUM(Total) TotalSales
--FROM Invoice
--GROUP BY BillingCountry;

--top_country.sql: Which country's customers spent the most?
--SELECT MAX(Country) Country, MAX(TotalSales) Sales
--FROM (
--	SELECT BillingCountry Country, SUM(Total) TotalSales
--	FROM Invoice
--	GROUP BY BillingCountry
--) AS Highest;

--top_2013_track.sql: Provide a query that shows the most purchased track of 2013.
--SELECT top 1 t.Name TrackName, COUNT(il.TrackId) TrackSales
--	FROM InvoiceLine il
--	JOIN Invoice i ON i.InvoiceId = il.InvoiceId
--	JOIN Track t ON t.TrackId = il.TrackId
--	WHERE DATEPART(yyyy, i.InvoiceDate) = 2013
--	GROUP BY t.Name
--	ORDER BY TrackSales DESC

--top_5_tracks.sql: Provide a query that shows the top 5 most purchased songs.
--SELECT top 5 t.Name TrackName, COUNT(il.TrackId) TrackSales
--	FROM InvoiceLine il
--	JOIN Invoice i ON i.InvoiceId = il.InvoiceId
--	JOIN Track t ON t.TrackId = il.TrackId
--	GROUP BY t.Name
--	ORDER BY TrackSales DESC

--top_3_artists.sql: Provide a query that shows the top 3 best selling artists.
--SELECT TOP 3 a.Name ArtistName, COUNT(il.InvoiceLineId) ArtistSales
--FROM InvoiceLine il
--JOIN Invoice i ON il.InvoiceId = i.InvoiceId
--JOIN Track t ON il.TrackId = t.TrackId
--JOIN Album al ON al.AlbumId = t.AlbumId
--JOIN Artist a ON a.ArtistId = al.ArtistId
--GROUP BY a.Name
--ORDER BY ArtistSales DESC;

--top_media_type.sql: Provide a query that shows the most purchased Media Type.
--SELECT TOP 1 mt.Name MediaType, COUNT(il.Quantity) MediaTypeSales
--FROM InvoiceLine il
--JOIN Invoice i ON il.InvoiceId = i.InvoiceId
--JOIN Track t ON il.TrackId = t.TrackId
--JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId
--GROUP BY mt.Name
--ORDER BY MediaTypeSales DESC;