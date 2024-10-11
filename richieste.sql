-- Every invoice
SELECT * FROM invoices;
-- Every invoice ordered by total invoice amount ("total")
SELECT * FROM invoices ORDER BY total DESC;
-- Every invoice with a total greater than 10
SELECT * FROM invoices WHERE total>10 ORDER BY total DESC;
-- The 10 most expensive invoices
SELECT * FROM invoices ORDER BY total DESC LIMIT 10;
-- The 15 most recent invoices
SELECT * FROM invoices ORDER BY invoice_date DESC LIMIT 15;
-- The 15 oldest invoices
SELECT * FROM invoices ORDER BY invoice_date LIMIT 15;
-- The 10 most expensive invoices from the US
SELECT * FROM invoices WHERE billing_country="USA" ORDER BY total DESC LIMIT 10;
-- The 10 least expensive invoices from the US
SELECT * FROM invoices WHERE billing_country="USA" ORDER BY total LIMIT 10;
-- The 10 most expensive invoices from outside the US
SELECT * FROM invoices WHERE billing_country!="USA" ORDER BY total DESC LIMIT 10;
-- A list of all the invoices worth more than $5.00 from Chicago, IL
SELECT * FROM invoices WHERE total>5 AND billing_city="Chicago" AND billing_state="IL" AND billing_country="USA";
-- The billing addresses of the 5 most valuable invoices from Mountain View CA
SELECT billing_address, billing_city, billing_state, billing_country FROM invoices WHERE billing_city="Mountain View" AND billing_state="CA" ORDER BY total DESC LIMIT 5;
-- A list of the 10 most valuable invoices made before January 1st, 2010
-- Hint: Dates are formatted like 'YYYY-MM-DD' and you can compare them using '<', '>', '<=' and '>='
SELECT * FROM invoices WHERE invoice_date < "2010-01-01" ORDER BY total DESC LIMIT 10;
-- The count, total, and average of invoice totals, grouped by state, ordered by average invoice total from highest-to-lowest
SELECT billing_state, COUNT(*), SUM(total), AVG(total) FROM invoices WHERE billing_country = "USA" GROUP BY billing_state ORDER BY AVG(total) DESC;
-- A list of the top 5 countries by number of invoices
SELECT billing_country, COUNT(*) FROM invoices GROUP BY billing_country ORDER BY COUNT(*) DESC LIMIT 5;
-- A list of the top 5 countries by gross/total invoice size
SELECT billing_country, SUM(total) FROM invoices GROUP BY billing_country ORDER BY SUM(total) DESC LIMIT 5;
-- A list of the top 5 countries by average invoice size
SELECT billing_country, AVG(total) FROM invoices GROUP BY billing_country ORDER BY AVG(total) DESC LIMIT 5;
--
--
-- A list of the top 5 US states by number of invoices
-- Hint: You'll need to filter the results with WHERE billing_country = 'USA'
SELECT billing_state, COUNT(*) AS invoice_count
FROM invoices
WHERE billing_country='USA'
GROUP BY billing_state
ORDER BY invoice_count DESC 
LIMIT 5;
-- A list of the top 5 US states by gross sales
SELECT billing_state,total
FROM invoices
WHERE billing_country='USA'
GROUP BY total
ORDER BY total DESC 
LIMIT 5;
-- A list of the top 5 US states by average invoice size
SELECT billing_state, AVG(total) AS invoice_avg
FROM invoices
WHERE billing_country='USA'
GROUP BY billing_state
ORDER BY invoice_avg DESC 
LIMIT 5;
-- A list of the top 10 US cities by number of invoices
SELECT billing_city, COUNT(*) AS invoice_count
FROM invoices
WHERE billing_country='USA'
GROUP BY billing_city
ORDER BY invoice_count DESC 
LIMIT 10;
-- A list of the top 10 US cities by gross sales
SELECT billing_city,total
FROM invoices
WHERE billing_country='USA'
GROUP BY total
ORDER BY total DESC 
LIMIT 10;
-- A list of the top 10 US cities by average invoice size
SELECT billing_city, AVG(total) AS invoice_avg
FROM invoices
WHERE billing_country='USA'
GROUP BY billing_state
ORDER BY invoice_avg DESC 
LIMIT 10;
-- A list of the top 3 cities in California by number of invoices
-- Hint: You'll need a WHERE clause filtering by both billing_country and billing_state
SELECT billing_city, COUNT(*) AS invoice_count
FROM invoices
WHERE billing_country='USA' AND billing_state='CA'
GROUP BY billing_city
ORDER BY invoice_count DESC 
LIMIT 3;
-- A list of the top 3 cities in California by gross sales
SELECT billing_city,total
FROM invoices
WHERE billing_country='USA' AND billing_state='CA'
GROUP BY billing_city
ORDER BY total DESC 
LIMIT 3;
-- A list of the top 3 cities in California by average invoice size
SELECT billing_city, AVG(total) AS invoice_avg
FROM invoices
WHERE billing_country='USA' AND billing_state='CA'
GROUP BY billing_state
ORDER BY invoice_avg DESC 
LIMIT 3;
-- "customers" table
-- Remember: run ".schema customers" to see what fields (columns) the customers table contains.
SELECT * FROM customers
-- A list of the top 3 countries by total number of customers
SELECT country, COUNT(*) AS country_count
FROM customers
GROUP BY country
ORDER BY country_count DESC 
LIMIT 3;
-- A list of the top 7 cities (anywhere) by total number of customers
SELECT city, COUNT(*) AS city_count
FROM customers
GROUP BY city
ORDER BY city_count DESC 
LIMIT 7;