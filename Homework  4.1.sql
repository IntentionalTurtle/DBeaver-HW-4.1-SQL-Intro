--Q1 How many actors are there with the last name ‘Wahlberg’?
select count(last_name)
from actor 
where last_name like 'Wahlberg';

--Q2 How many payments were made between $3.99 and $5.99?
select count(amount)
from payment 
where amount > 3.99 and amount < 5.99;

--Q3 What film does the store have the most of? (search in inventory)
select film_id,
count(film_id) as how_many
from inventory
group by film_id
order by how_many desc
limit 1;

--Q4 How many customers have the last name ‘William’?
select count(last_name) from customer where last_name like 'William';

--Q5 What store employee (get the id) sold the most rentals? (going to use the rentals table)
select staff_id, count(staff_id) as rentalcount
from rental 
group by staff_id 
order by rentalcount
limit 1;

--Q6 How many different district names are there? (from address table?)
select count(distinct district) from address

--Q7 What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(distinct actor_id) as number_of_actors
from film_actor 
group by film_id 
order by number_of_actors desc
limit 1;

--Q8 From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(last_name)
from customer 
where last_name like '%es'

--Q9 How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
create table payment_matt as
	select amount, count(amount) as num_of_purchases
	from payment
	where customer_id >380 and customer_id < 430
	group by amount 
	order by num_of_purchases desc
	
select amount, num_of_purchases
from payment_matt
where num_of_purchases > 250

--Q10 Within the film table, how many rating categories are there? And what rating has the most movies total?
select count(distinct rating) from film

select rating, count(rating) as num_of_films
from film 
group by rating
order by num_of_films desc
limit 1