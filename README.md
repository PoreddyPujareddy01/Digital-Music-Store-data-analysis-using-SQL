# SQL_PROJECT_MUSIC_STORE_ANALYSIS
## Project Overview
#### Project Title: Music Store Analysis
#### Database: music_store

This project is designed to provide a foundational understanding of data analysis using SQL within the context of a music store’s playlist database. Participants will learn how to navigate and analyze a dataset to derive actionable insights that can inform business decisions and support strategic growth.

![music2](https://github.com/user-attachments/assets/f11cb983-3438-4b39-89f9-58608ed59b42)



##### Objectives:
1.Learn to analyze a music playlist database using SQL to uncover insights that drive business decisions and support strategic growth.

2.CTAS (Create Table As Select): Utilize CTAS to create new tables based on query results.

### Project Structure

##### 1.Database Setup
![Screenshot 2024-08-29 083022](https://github.com/user-attachments/assets/fcc8e047-39eb-49f8-9596-1f8baba9e1fc)
##### Database Creation: Created a datbase named music_store.
##### Table Creation: Created tables for album,artist,customer,employee,genre,invoice,invoice_line,media_type,playlist,playtist_track,track. Each table includes relevant columns and relationships.

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
