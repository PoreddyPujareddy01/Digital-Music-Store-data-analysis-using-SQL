--- QUESTION SET 2 - MODERATE

Q1 :Write query to return the email,first name,last name & genre of all
Rock Music listerners. Return your list ordered alphabetically by email
starting with A.

SELECT DISTINCT email,first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock')
ORDER BY email;

Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.

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

Q3 : Return all the track names that have a song length longer than the average song
length. Return the name and milliseconds for each track. Order by the song length with
the longest songs listed first.

SELECT * FROM TRACK;
SELECT * FROM PLAYLIST_TRACK;

SELECT 
    name, 
    milliseconds 
FROM 
    track 
WHERE 
    milliseconds > (SELECT AVG(milliseconds) AS avg_song_length FROM track)
ORDER BY 
    milliseconds DESC;

Q4 : Write a query to find the most popular music
genre by counting the number of tracks per genre from the genre and track tables.

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

Q5 : Write a query to list all employees who work in a specific city,
such as "Calgary," using the employee table.

SELECT * FROM EMPLOYEE;
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
