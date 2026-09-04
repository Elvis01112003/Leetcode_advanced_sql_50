with cte as(select customer_number, count(*) as order_count from orders group by customer_number),
ranked as(select customer_number, order_count, rank() over(order by order_count ) as rnk from cte)  
select customer_number from ranked
where rnk = 1
