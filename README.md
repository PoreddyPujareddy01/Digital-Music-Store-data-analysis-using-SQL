# SQL_PROJECT_MUSIC_STORE_ANALYSIS
## Project Overview
#### Project Title: Music Store Analysis
##### Database: music_store

This project is designed to provide a foundational understanding of data analysis using SQL within the context of a music store’s playlist database. Participants will learn how to navigate and analyze a dataset to derive actionable insights that can inform business decisions and support strategic growth.

![music2](https://github.com/user-attachments/assets/f11cb983-3438-4b39-89f9-58608ed59b42)



### Objectives:
1.Learn to analyze a music playlist database using SQL to uncover insights that drive business decisions and support strategic growth.

2._CTAS_ (Create Table As Select): Utilize CTAS to create new tables based on query results.
## Database and Tools
- Postgre SQL
- PgAdmin4
### Project Structure:

### 1.Database Setup
![Screenshot 2024-08-29 083022](https://github.com/user-attachments/assets/fcc8e047-39eb-49f8-9596-1f8baba9e1fc)

-  Database Creation: *Created a datbase named music_store*.

- Table Creation: *Created tables for album,artist,customer,employee,genre,invoice,invoice_line,media_type,playlist,playtist_track,track. Each table includes relevant columns and relationships*.

```sql
CREATE DATABASE music_store;

-- Create table "ALBUM"
CREATE TABLE ALBUM (
    ALBUM_ID INT PRIMARY KEY,
    TITLE VARCHAR(200),
    ARTIST_ID INT
);


-- Create table "ARTIST"
CREATE TABLE ARTIST (
    ARTIST_ID INT PRIMARY KEY,
    NAME VARCHAR(100)
);


-- Create table "CUSTOMER"
CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(90),
    LAST_NAME VARCHAR(90),
    COMPANY VARCHAR(250),
    ADDRESS VARCHAR(250),
    CITY VARCHAR(100),    
    STATE CHAR(20),    
    COUNTRY CHAR(90),
    POSTAL_CODE VARCHAR(100),
    PHONE VARCHAR(100),    
    FAX VARCHAR(100),
    EMAIL VARCHAR(100),
    SUPPORT_REP_ID INT
);


-- Create table "EMPLOYEE"
CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID INT PRIMARY KEY,
    LAST_NAME VARCHAR(90),
    FIRST_NAME VARCHAR(90),
    TITLE VARCHAR(200),    
    REPORTS_TO INT,
    LEVELS VARCHAR(20),
    BIRTHDATE DATE,
    HIRE_DATE DATE,
    ADDRESS VARCHAR(250),
    CITY VARCHAR(100),    
    STATE CHAR(20),
    COUNTRY CHAR(90),
    POSTAL_CODE VARCHAR(100),
    PHONE VARCHAR(100),
    FAX VARCHAR(100),
    EMAIL VARCHAR(100)
);


-- Create table "GENRE"
CREATE TABLE GENRE (
    GENRE_ID INT PRIMARY KEY,
    NAME VARCHAR(100)
);


-- Create table "INVOICE"
CREATE TABLE INVOICE (
    INVOICE_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    INVOICE_DATE DATE,
    BILLING_ADDRESS VARCHAR(200),
    BILLING_CITY VARCHAR(200),
    BILLING_STATE VARCHAR(100),
    BILLING_COUNTRY CHAR(20),
    BILLING_POSTAL_CODE VARCHAR(100),
    TOTAL FLOAT
);


-- Create table "INVOICE_LINE"
CREATE TABLE INVOICE_LINE (
    INVOICE_LINE_ID INT PRIMARY KEY,
    INVOICE_ID INT,
    TRACK_ID INT,
    UNIT_PRICE FLOAT,
    QUANTITY INT
);


-- Create table "MEDIA_TYPE"
CREATE TABLE MEDIA_TYPE (
    MEDIA_TYPE_ID INT PRIMARY KEY,
    NAME VARCHAR(100)
);


-- Create table "PLAYLIST"
CREATE TABLE PLAYLIST (
    PLAYLIST_ID INT PRIMARY KEY,
    NAME VARCHAR(100)
);


-- Create table "PLAYLIST_TRACK"
CREATE TABLE PLAYLIST_TRACK (
    PLAYLIST_ID INT PRIMARY KEY,
    TRACK_ID INT
);


-- Create table "TRACK"
CREATE TABLE TRACK (
    TRACK_ID INT PRIMARY KEY,
    NAME VARCHAR(250),    
    ALBUM_ID INT,    
    MEDIA_TYPE_ID INT,
    GENRE_ID INT,
    COMPOSER VARCHAR(250),    
    MILLISECONDS INT,
    BYTES INT,
    UNIT_PRICE FLOAT
);
```

### 2.QUESTION SET - EASY

#### Q1:Who is the senior most employee based on job title? 
```sql
SELECT * 
FROM employee
ORDER BY levels DESC
LIMIT 1;
```

#### Q2: Which countries have the most Invoices?
```sql
SELECT 
    billing_country,
    COUNT(billing_country) AS total_countries
FROM 
    invoice
GROUP BY 
    billing_country
ORDER BY 
    total_countries DESC;
```
#### Q3:What are Top 3 values of total invoice?
```sql
SELECT 
    total 
FROM 
    invoice
ORDER BY 
    total DESC
LIMIT 3;
```

#### Q4: Which city has the best customers? We would like to throw a promotional
Music Festival in the city we made the most money. Write a query that returns
one city that has the highest sum of invoice totals. Return both the city name
and sum of all invoice totals.
```sql
SELECT 
    billing_city,
    SUM(total) AS total_invoice
FROM 
    invoice
GROUP BY 
    billing_city
ORDER BY 
    total_invoice DESC;
```

#### Q5 :Who is the best customer?The customer who has spent the most money will
be declared the best customer. Write a query that returns the person who has
spent the most money.
```sql
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
```


### 3.QUESTION SET - MODERATE

#### Q6 :Write query to return the email,first name,last name & genre of all
Rock Music listerners. Return your list ordered alphabetically by email
starting with A.
```sql
SELECT DISTINCT email,first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock')
ORDER BY email;
```
#### Q7: Let's invite the artists who have written the most rock music in our dataset.
Write a query that returns the Artist name and total track count of the top 10 rock bands.
```sql
SELECT 
    artist.artist_id, 
    artist.name,
    COUNT(artist.artist_id) AS number_of_songs
FROM 
    track
JOIN 
    album ON album.album_id = track.album_id
JOIN 
    artist ON artist.artist_id = album.artist_id
JOIN 
    genre ON genre.genre_id = track.genre_id
WHERE 
    genre.name LIKE 'Rock'
GROUP BY 
    artist.artist_id, artist.name
ORDER BY 
    number_of_songs DESC
LIMIT 10;
```
#### Q8: Return all the track names that have a song length longer than the average song length. Return the name and milliseconds for each track. Order by the song length with the longest songs listed first.
```sql
SELECT 
    name, 
    milliseconds 
FROM 
    track 
WHERE 
    milliseconds > (SELECT AVG(milliseconds) AS avg_song_length FROM track)
ORDER BY 
    milliseconds DESC;
```
#### Q9: Write a query to find the most popular music genre by counting the number of tracks per genre from the genre and track tables.
```sql
SELECT 
    g.name AS genre_name, 
    COUNT(t.track_id) AS track_count
FROM 
    genre g
JOIN 
    track t ON g.genre_id = t.genre_id
GROUP BY 
    g.name
ORDER BY 
    track_count DESC
LIMIT 1;
```
#### Q10: Write a query to list all employees who work in a specific city, such as "Calgary"
using the employee table.
```sql
SELECT 
    employee_id, 
    first_name, 
    last_name, 
    title, 
    city
FROM 
    employee
WHERE 
    city = 'Calgary';

```


### 4.QUESTION SET - ADVANCE

#### Q11 : We want to find out the most popular music Genre for each country.
We determine the most popular genre as the genre with the highest amount of purchases.
Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres.
```sql
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
```

#### Q12 :Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount.
SELECT * FROM INVOICE;
SELECT * FROM CUSTOMER;
```sql
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
```
#### Q13 : Write a query to calculate the total revenue generated
per genre by joining the genre, track, invoice_line, and invoice tables.
```sql
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
```
