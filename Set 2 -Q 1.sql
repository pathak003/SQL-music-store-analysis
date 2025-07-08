--Write a query to return the email, first name, last name and genre of all rock music listeners. 
--Return your list ordered alphabetically by email starting with A.


select distinct email, first_name , last_name
from customer
join invoice 
on customer.customer_id = invoice.customer_id
join invoice_line
on invoice_line.invoice_id = invoice.invoice_id
where track_id in(
  select track_id from track
  join genre on track.genre_id = genre.genre_id
  where genre.name LIKE 'Rock')
order by email