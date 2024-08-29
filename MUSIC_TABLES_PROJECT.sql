CREATE TABLE ALBUM(ALBUM_ID INT,
TITLE VARCHAR(200),
ARTIST_ID INT);
SELECT * FROM ALBUM;
CREATE TABLE ARTIST(ARTIST_ID INT,
NAME VARCHAR(100));
SELECT * FROM ARTIST;
CREATE TABLE CUSTOMER(CUSTOMER_ID INT,
FIRST_NAME VARCHAR(90),
last_name VARCHAR(90),
company	VARCHAR(250),
address VARCHAR(250),
city VARCHAR(100),	
state CHAR(20),	
country	CHAR(90),
postal_code VARCHAR(100),
phone VARCHAR(100),	
fax VARCHAR(100),
email VARCHAR(100),
support_rep_id INT
);
SELECT * FROM CUSTOMER;
CREATE TABLE EMPLOYEE
(employee_id INT,
last_name	VARCHAR(90),
first_name	VARCHAR(90),
title VARCHAR(200),	
reports_to	INT,
levels	VARCHAR(20),
birthdate	DATE,
hire_date	DATE,
address VARCHAR(250),
city VARCHAR(100),	
state	CHAR(20),
country	CHAR(90),
postal_code	VARCHAR(100),
phone	VARCHAR(100),
fax	VARCHAR(100),
email VARCHAR(100)
);
SELECT * FROM EMPLOYEE;
CREATE TABLE GENRE(genre_id	INT,
name VARCHAR(100)
);
SELECT * FROM GENRE;
CREATE TABLE INVOICE(invoice_id INT,
customer_id INT,
invoice_date DATE,
billing_address VARCHAR(200),
billing_city VARCHAR(200),
billing_state VARCHAR(100),
billing_country CHAR(20),
billing_postal_code VARCHAR(100),
total FLOAT
);
SELECT * FROM INVOICE;
CREATE TABLE INVOICE_LINE(invoice_line_id INT,
invoice_id INT,
track_id INT,
unit_price FLOAT,
quantity INT
);
SELECT * FROM INVOICE_LINE;
CREATE TABLE MEDIA_TYPE(
media_type_id INT,name VARCHAR(100));
SELECT * FROM MEDIA_TYPE;
CREATE TABLE PLAYLIST(
playlist_id INT,
name VARCHAR(100));
SELECT * FROM PLAYLIST;
CREATE TABLE PLAYLIST_TRACK(
playlist_id INT,
track_id INT);
SELECT * FROM PLAYLIST_TRACK;
CREATE TABLE TRACK(
track_id INT,
name VARCHAR(250),	
album_id INT,	
media_type_id INT,
genre_id INT,
composer VARCHAR(250),	
milliseconds INT,
bytes INT,
unit_price FLOAT
);
SELECT * FROM TRACK;
