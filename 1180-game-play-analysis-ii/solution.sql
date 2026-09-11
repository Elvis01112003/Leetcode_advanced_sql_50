with cte as(select player_id,event_date, device_id ,row_number() over(partition by player_id order by event_date ) rn from activity) select player_id, device_id from cte where rn = 1
