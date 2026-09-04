with ranked as( select d.name as department, e.name as employee, e.salary as Salary, rank() over(partition by d.name order by e.salary desc) as rnk from employee e
left join department d
on d.id = e.departmentid)
select department, employee, Salary from ranked
where rnk = 1;
