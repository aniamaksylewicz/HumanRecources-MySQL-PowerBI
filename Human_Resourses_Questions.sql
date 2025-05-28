-- QUESTIONS
select * from human_resources hr ;

-- 1. What is the gender breakdown of employees in the company?
select 
	gender
	,count(gender) as count
from human_resources hr 
where age >= 18 and termdate is null
group by 1;
	
-- 2. What is the race/ethnicity breakdown of employees in the company?
select 
	race
	,count(race) as no_of_employee
from human_resources hr 
where age >=18 and termdate is null
group by 1
order by 2 desc;

-- 3. What is the age distribution of employees in the company?
select 
	min(age) as min_employee_age
	,max(age) as max_employee_age
from human_resources hr 
where age>=18  and termdate is null;
	

select 
	case 
		when age >=18 and age <=24 then '18-24'
		when age between 25 and 34 then '25-34'
		when age between 35 and 44 then '35-44'
		when age between 45 and 54 then '45-54'
		else '55+'
	end as age_group
	,count(*) as count
from human_resources hr
where age>=18  and termdate is null
group by age_group
order by age_group
;

-- 3a distribution of gender among age group
select 
	case
		when age >=18 and age <=24 then '18-24'
		when age between 25 and 34 then '25-34'
		when age between 35 and 44 then '35-44'
		when age between 45 and 54 then '45-54'
		else '55+'
	end as age_group
	,gender
	,count(*) as count
from human_resources hr
where age>=18  and termdate is null
group by age_group,gender
order by age_group, count desc
;

-- 4. How many employees work at headquarters versus remote locations? 
select
	location
	,count(*)
from human_resources hr 
where age>=18  and termdate is null
group by 1
order by 2 desc;

-- 5. What is the average length of employment for employees who have been terminated?
select 
	round(avg(dateDIFF(termdate, hire_date)/365),1)  as avg_eployment_time
from human_resources hr 
where termdate <= curdate() and termdate is not null and age >= 18;


-- 6. How does the gender distribution vary across departments?
select 
	gender
	,department
	,count(*) as count
from human_resources hr
where age>=18  and termdate is null
group by 1,2
order by 2,1;

-- 7. What is the distribution of job titles across the company?
select 
	jobtitle
-- 	,gender
	,count(*) as count
from human_resources hr 
where age>=18  and termdate is null
group by 1
order by 1 desc, 2 desc;

-- 8. Which department has the highest turnover rate?
select 
	department
	,terminated_employee
	,total_employee
	,round((terminated_employee/total_employee),2) as termination_rate
from 
	(
		select
			department
			,count(*) as total_employee
			,sum(case when termdate  is not null and termdate <= curdate() then 1 else 0 end) as terminated_employee
		from human_resources hr 
		where age>=18
		group by 1
		) as sub 
group by 1
order by 4 desc
;

-- 8a Which gender has the highest turnover rate  in departments
select 
	department
	,gender
	,terminated_employee
	,total_employee
	,round((terminated_employee/total_employee),2) as termination_rate
from 
	(
		select
			department
			,gender
			,count(*) as total_employee
			,sum(case when termdate  is not null and termdate <= curdate() then 1 else 0 end) as terminated_employee
		from human_resources hr 
		where age>=18
		group by 1,2
		) as sub 
group by 1,2
order by 1, 5 desc
;



-- 9. What is the distribution of employees across  state?
select 
	location_state
	,count(*) as no_of_employee
from human_resources hr 
where age >=18 and termdate is null
group by 1
order by no_of_employee desc;


-- 10. How has the company's employee count changed over time based on hire and term dates?
select
	min(hire_date) as first_hire
	,max(hire_date)as last_hire
	,min(termdate) as first_termination
	,max(hire_date) as last_termination
from human_resources hr; 


select
	calendar_year
	,no_of_hired_employee
	,no_of_terminated_employee
	,no_of_hired_employee - no_of_terminated_employee as net_change
	,round((no_of_hired_employee - no_of_terminated_employee)/no_of_hired_employee *100, 2) as net_change_percentage
from 
	(
	select 
		year(hire_date) as calendar_year
		,count(hire_date) as  no_of_hired_employee
		,sum(case when termdate is not null and termdate <= curdate() then 1 else 0 end) as  no_of_terminated_employee
	from human_resources hr 
	where age>=18
	group by 1
	) as sub
group by calendar_year
order by 1 ;


-- 11. What is the avarage employment time among departments?
select 
	department
	,round(avg(dateDIFF(termdate, hire_date)/365),0) as avg_eployment_time
from human_resources hr 
where termdate <= curdate() and termdate is not null and age >= 18
group by 1;
