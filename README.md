# Portfolio_Projects
This repository contains all the data analytics portfolio projects ranging from SQL, Power BI, Excel ,Tableau

# Project 1 : Sales Analysis
This sales data analysis project entails analyzing a company's sales data and indicating profit by product, sales, and other significant factors that might influence the company's performance.

# Tools used:
Ms SQL, 
Power BI, 
Microsoft Excel.

![image](https://user-images.githubusercontent.com/123229246/221352294-ac72da09-77f4-421a-a103-7c81a2b61f99.png)

One data source (AdventureWorksDW2019.bak) was provided in Excel format and were connected in the data model in a later step of the process.

# Data Cleansing & Transformation (SQL)
1. Understanding the difference between FACT tables & Dimension tables.
2. Identifying  which tables in the data are of interest.
3. Choosing which columns are of interest to export by preparing and transforming these columns in SQL using concepts such as: renaming columns, combining columns, commenting in SQL script, formatting of SQL statements, WHERE clause, ORDER BY, LEFT JOIN, CASE() function and ISNULL() function.

# Data Visualization through Power BI
1. Loading the cleansed and transformed data(tables).
2. Connecting the data model based on the relationship of the tables required.
3. Calculating the required measures needed and importing the custom visuals.
4. Visualizing the data such as sales, performance, revenue/costs/profit through various visual charts(pie chart, bar chart, doughnut chart etc.,).

# Sales Management Dashboard

The finished sales management dashboard is shown below.
![image](https://user-images.githubusercontent.com/123229246/221353111-e204c0a8-c3f7-4ae8-9469-18338c82355b.png)

![image](https://user-images.githubusercontent.com/123229246/221353119-223024b9-5467-4315-85a8-c7dd4ec9ef07.png)


# Project 2 : Movie Sales Visualization

This project aims to take a dataset that shows movie sales over time and turn it into an interactive visual experience.

Dataset from Kaggle : https://www.kaggle.com/datasets/mustafacicek/imdb-top-250-lists-1996-2020

# Tools used:
Power BI, 
Microsoft Excel.

# Movie Sales dashboard
Analyzing the movie sales data and figuring out the profit per movie and other significant factors related to the performance and sales by cleaning, transforming and visualizing the data.

![image](https://user-images.githubusercontent.com/123229246/221353294-cfd4f6f6-1955-4366-8b24-4c0867de467d.png)


# Project 3 : OTT platform sales 
This project analyzes different OTT platform sales such as Netflix, Disney+Hotstar, Amazon Prime.

By using the Query Editor in Power BI for data cleaning and preparation interactive visual dashboards are created which depicts the profits, revenue/costs etc., by each movie/series.

Dataset from Kaggle:

Netflix Dataset - https://www.kaggle.com/datasets/shivamb/netflix-shows
Amazon Prime Dataset - https://www.kaggle.com/datasets/shivamb/amazon-prime-movies-and-tv-shows
Hotstar Dataset - https://www.kaggle.com/datasets/shivamb/disney-movies-and-tv-shows

# Tools used:
Power BI, 
Microsoft Excel.


# OTT Platform  dashboard
Analyzing the data and figuring out the  significant factors related to the performance and sales per each movie/series by cleaning, transforming and visualizing the data.

![image](https://user-images.githubusercontent.com/123229246/221353768-1f9b13de-01e8-4ee0-9f6e-a5ed2626a387.png)

![image](https://user-images.githubusercontent.com/123229246/221353777-91ea8bf9-bea3-4f3d-bfd9-2ee31e2534e0.png)

![image](https://user-images.githubusercontent.com/123229246/221353782-3a8f1132-36b1-4a5d-8709-7686e2b447e7.png)


# Project 4 : IT Ticket Analysis
This project aims at visualizing different kinds of tickets raised by the customers/employees in an IT infracture
Using the Query Editor in Power BI and by calculating the required measures we can depict the no. of tickets rasied by individual/team, types of tickets raised, satisfaction index etc., and visualizing them in a dashboard.

# Tools used:
Power BI, 
Microsoft Excel.

# IT Ticket analysis dashboard

![image](https://user-images.githubusercontent.com/123229246/221354156-28218966-71bb-4dbc-8bd5-17afc2724156.png)


# Project 5 : Music Store database(SQL)

This project analyzes the information about a music store. The main aim of this project is to understand the media in the store, their customers and employees, and their invoice information. 
The schema for the database is provided below. You can see the columns that link tables together via the arrows.

![image](https://user-images.githubusercontent.com/123229246/221354382-4e2688f5-8c7b-4df8-9307-a48b21c3b562.png)

# Tools used 
Ms SQL

# SQL code
The SQL code I used to extract the data is given below.

--Selecting the citites with best customers
  
SELECT 
  BILLINGCITY, 
  SUM(TOTAL) 
FROM INVOICE 
GROUP BY 1 
ORDER BY 2 DESC

--Selecting the best customer

SELECT 
  C.CUSTOMER_ID, 
  SUM(I.TOTAL) 
FROM 
  CUSTOMER C 
  JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID 
GROUP BY 1 
ORDER BY 2 DESC

--Selecting how much did the users spent total per country

SELECT 
  C.COUNTRY, 
  C.FIRSTNAME || ' ' || C.LASTNAME AS CUSTOMER, 
  SUM(I.TOTAL) 
FROM 
  INVOICE I 
  JOIN CUSTOMER C ON C.CUSTOMER_ID = I.CUSTOMER_ID 
GROUP BY 1, 2 
ORDER BY 3 DESC

--Selecting the songs per genre

SELECT 
  G.NAME, 
  COUNT(T.TRACK_ID) 
FROM 
  TRACK T 
  JOIN GENRE G ON T.GENRE_ID = G.GENRE_ID 
GROUP BY 1 
ORDER BY 2 DESC


--Selecting all the track names that have a song length longer than the average song length.

SELECT NAME,MILISECONDS
FROM TRACK
WHERE MILISECONDS > (
	SELECT AVG(MILISECINDS) AS AVG_TRACK_LENGTH
	FROM TRACK )
ORDER BY MILISECONDS DESC;


--Selecting the rock bands. For this ,extracting Genre, Track , Album, and Artist tables

SELECT 
  AR.NAME, 
  COUNT(T.NAME) 
FROM 
  TRACK T 
  JOIN GENRE G ON T.GENRE_ID = G.GENRE_ID 
  JOIN ALBUM AL ON AL.ALBUM_ID = T.ALBUM_ID 
  JOIN ARTIST AR ON AR.ARTIST_ID = AL.ARTIST_ID 
WHERE 
  G.NAME = 'Rock' 
GROUP BY 1 
ORDER BY 2 DESC

--Selecting how much did each customer spent per genre

SELECT 
  C.CUSTOMER_ID, 
  C.LASTNAME, 
  C.FIRSTNAME, 
  G.NAME GENRE, 
  SUM(IL.UNITPRICE) 
FROM 
  CUSTOMER C 
  JOIN INVOICE I ON I.CUSTOMER_ID = C.CUSTOMER_ID 
  JOIN INVOICELINE IL ON IL.INVOICE_ID = I.INVOICE_ID 
  JOIN TRACK T ON T.TRACK_ID = IL.TRACK_ID 
  JOIN GENRE G ON G.GENRE_ID = T.GENRE_ID 
GROUP BY 1,2,3,4
ORDER BY 1

--Selecting how much was spent all over for each genre

SELECT 
  G.NAME GENRE, 
  SUM(IL.UNITPRICE) 
FROM 
  CUSTOMER C 
  JOIN INVOICE I ON I.CUSTOMER_ID = C.CUSTOMER_ID 
  JOIN INVOICELINE IL ON IL.INVOICE_ID = I.INVOICE_ID 
  JOIN TRACK T ON T.TRACK_ID = IL.TRACK_ID 
  JOIN GENRE G ON G.GENRE_ID = T.GENRE_ID 
GROUP BY 1 
ORDER BY 2 DESC

--Finding which artist has earned the most using InvoiceLines

SELECT 
  Y.NAME AS ARTIST_NAME, 
  SUM(TOTAL) AS GRAND_TOTAL 
FROM(
    SELECT 
      X.NAME, 
      X.UNITPRICE * X.QUANTITY AS TOTAL 
    FROM(
        SELECT 
          AR.NAME, 
          IL.UNITPRICE, 
          IL.QUANTITY 
        FROM 
          ARTIST AR 
          JOIN ALBUM AL ON AR.ARTIST_ID = AL.ARTIST_ID 
          JOIN TRACK T ON AL.ALBUM_ID = T.ALBUM_ID 
          JOIN INVOICELINE IL ON T.TRACK_ID = IL.TRACK_ID 
        ORDER BY 1 DESC
		) AS X
  ) AS Y 
GROUP BY 1 
ORDER BY 2 DESC 

--Selecting the top purchasers

SELECT 
  C.CUSTOMER_ID, 
  C.FIRSTNAME || ' ' || C.LASTNAME AS CUSTOMER, 
  AR.NAME AS ARTIST, 
  SUM(IL.UNITPRICE) AS PRICE 
FROM 
  CUSTOMER C 
  JOIN INVOICE I ON C.CUSTOMER_ID = I.CUSTOMER_ID 
  JOIN INVOICELINE IL ON I.INVOICE_ID = IL.INVOICE_ID 
  JOIN TRACK T ON IL.TRACK_ID = T.TRACK_ID 
  JOIN ALBUM AL ON T.ALBUM_ID = AL.ALBUM_ID 
  JOIN ARTIST AR ON AL.ARTIST_ID = AR.ARTIST_ID 
WHERE AR.NAME = 'Iron Maiden' 
GROUP BY 1,2,3
ORDER BY 4 DESC 









