-- 1. we would like to throw a promotial music festival in the city , write a query that returns one city that has the higest sum o
-- finvices total. Reture both the city name and summ of all invoices.

SELECT * from invoice;

SELECT SUM(total) as invoice_total, billing_city 
from invoice
group by billing_city
order by invoice_total desc
limit 4 ;

-- 2. who is the best customer? The customer who has spend the most money will
-- be declared the best customer. Write a query that returns the person who has spent the most money .

SELECT * FROM customer;
SELECT * FROM invoice;


SELECT customer.customer_id, customer.first_name,customer.last_name, SUM(invoice.total) as total
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
limit  1;


-- Question Set 2- Moderate :
-- Write query to return the email, first name, last name, genre of all Rock Music listeners. Return your list ordered alphabetically
-- by email starting with A


SELECT * FROM album ;

SELECT DISTINCT email, first_name, last_name 
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id =invoice_line.invoice_id
WHERE track_id IN(
     SELECT track_id FROM track
	 JOIN genre ON track.genre_id = genre.genre_id
	 WHERE genre.name LIKE 'Rock'
)
ORDER BY email ; 

select * from track ;

-- Question Set 3  :
-- let's invite the artist who have written the most rock music in our data set.
-- write  a query that return the artist  the  total track count of the top 10 rock bands .

SELECT artist.artist_id,artist.name,COUNT(artist.artist_id) AS number_of_songs
From track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10 ; 

-- Question Set 4  :
-- Return all the track names that have a song length longer then the average song length
-- Return the name and milosecond for each track. 
-- Order by the songs with the longest song listed first

SELECT name, milliseconds 
from track
WHERE milliseconds >(
     SELECT AVG(milliseconds) AS avg_track_length
	 FROM track)
ORDER BY milliseconds DESC;	 



