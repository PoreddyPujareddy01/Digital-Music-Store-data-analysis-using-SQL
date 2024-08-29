-- QUESTION SET 1 - EASY

Q1: Who is the senior most employee based on job title? 

SELECT * 
FROM employee
ORDER BY levels DESC
LIMIT 1;


Q2: Which countries have the most Invoices?

SELECT 
    billing_country,
    COUNT(billing_country) AS total_countries
FROM 
    invoice
GROUP BY 
    billing_country
ORDER BY 
    total_countries DESC;

Q3 : What are Top 3 values of total invoice?

SELECT 
    total 
FROM 
    invoice
ORDER BY 
    total DESC
LIMIT 3;


Q4 :Which city has the best customers? We would like to throw a promotional
Music Festival in the city we made the most money. Write a query that returns
one city that has the highest sum of invoice totals. Return both the city name
and sum of all invoice totals.

SELECT 
    billing_city,
    SUM(total) AS total_invoice
FROM 
    invoice
GROUP BY 
    billing_city
ORDER BY 
    total_invoice DESC;


Q5 :Who is the best customer?The customer who has spent the most money will
be declared the best customer. Write a query that returns the person who has
spent the most money.

SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    SUM(invoice.total) AS total
FROM 
    customer 
JOIN 
    invoice ON customer.customer_id = invoice.customer_id
GROUP BY 
    customer.customer_id
ORDER BY 
    total DESC
LIMIT 1;
