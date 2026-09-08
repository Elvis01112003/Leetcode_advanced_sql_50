select sp.name from salesperson sp
left join orders o
on o.sales_id = sp.sales_id
left join company c
on o.com_id = c.com_id
and c.name = 'RED'
where c.com_id is null
