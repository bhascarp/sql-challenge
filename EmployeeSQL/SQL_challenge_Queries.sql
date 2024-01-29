--Data Analysis Queries
-------------------------
--Query for Question 1
select e.emp_no, last_name, first_name, sex, salary
from employees e inner join salaries s
on e.emp_no = s.emp_no

--Query for Question 2
select first_name, last_name, hire_date
from employees									  
where date_part('year', hire_date) in
(
select year from
(select extract('year' from hire_date) as year from employees)
where year=1986);

--Query for Question 3
select first_name as manager_first_name, last_name as manager_last_name, dm.emp_no,
d.dept_no, dept_name from departments d
inner join dept_manager dm on d.dept_no=dm.dept_no
inner join employees e on dm.emp_no=e.emp_no
 
--Query for Question 4
select de.dept_no, e.emp_no, last_name, first_name, dept_name
from employees e join dept_emp de on e.emp_no=de.emp_no
join departments d on de.dept_no=d.dept_no
 
--Query for Question 5
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'
 
--Query for Question 6
select de.emp_no, last_name, first_name
from departments d
join dept_emp de on d.dept_no = de.dept_no
join employees e on de.emp_no = e.emp_no
where dept_name = 'Sales';

--Query for Question 7
select de.emp_no, last_name, first_name, dept_name
from departments d
join dept_emp de on d.dept_no = de.dept_no
join employees e on de.emp_no = e.emp_no
where dept_name in ('Sales', 'Development');
 
--Query for Question 8
select last_name, count(last_name) as last_name_frequency_count
from employees
group by last_name
order by last_name_frequency_count desc;


