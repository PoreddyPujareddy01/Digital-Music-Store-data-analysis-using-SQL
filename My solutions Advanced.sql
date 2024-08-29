--- QUESTION SET 3 - ADVANCE

Q1 : We want to find out the most popular music Genre for each country.
We determine the most popular genre as the genre with the highest amount of purchases.
Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres.

WITH popular_genre AS (
    SELECT 
        COUNT(invoice_line.quantity) AS purchases,
        customer.country,
        genre.name AS genre_name,
        genre.genre_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer.country
            ORDER BY COUNT(invoice_line.quantity) DESC
        ) AS rowno
    FROM invoice_line
    JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
    JOIN customer ON customer.customer_id = invoice.customer_id
    JOIN track ON track.track_id = invoice_line.track_id
    JOIN genre ON genre.genre_id = track.genre_id
    GROUP BY customer.country, genre.name, genre.genre_id
    ORDER BY customer.country ASC, purchases DESC
)
SELECT *
FROM popular_genre
WHERE rowno = 1;


Q2 :Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount.
SELECT * FROM INVOICE;
SELECT * FROM CUSTOMER;

WITH popular_customer AS(
    SELECT 
	customer.customer_id,
	first_name,last_name,
	billing_country,
	SUM(total) AS total_expenses,
    ROW_NUMBER() OVER(
	PARTITION BY billing_country
	ORDER BY SUM(total) DESC
	) AS rowno
  FROM customer 
  JOIN invoice on invoice.customer_id = customer.customer_id
  GROUP BY 1,2,3,4
  ORDER BY 4 ASC, 5 DESC
)
SELECT * FROM
popular_customer
WHERE rowno <= 1;

Q3 : Write a query to calculate the total revenue generated
per genre by joining the genre, track, invoice_line, and invoice tables.

SELECT 
    g.name AS genre_name,
    SUM(il.unit_price * il.quantity) AS total_revenue
FROM 
    genre g
JOIN 
    track t ON g.genre_id = t.genre_id
JOIN 
    invoice_line il ON t.track_id = il.track_id
JOIN 
    invoice i ON il.invoice_id = i.invoice_id
GROUP BY 
    g.name
ORDER BY 
    total_revenue DESC;