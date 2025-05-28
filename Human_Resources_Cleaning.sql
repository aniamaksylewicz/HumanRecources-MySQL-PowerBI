-- select the database
use human_resources hr;

-- preview data
select * from human_resources hr;

-- modify the data type of 'id' column from text to varchar
alter table human_resources 
modify column id varchar(20);

-- query helping to view structure and data types in the table
describe human_resources;

-- preview the'birthdate' column
select birthdate from human_resources hr ; 

-- sql_safe_updates =0 (disable safe updates, required when updating  without where clouse)  
set sql_safe_updates =0;

-- clean 'birthdate' column, change the type and format for 'y-m-d' format
update human_resources hr 
set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y)'),'%Y-%m-%d')
	when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'),'%Y-%m-%d')
	else null
end;

-- altering data type for 'birthdate' column from text to date
alter table human_resources 
modify column birthdate date;


describe human_resources;

-- clean 'hire_date' column, date format and data type modification  
update human_resources
set hire_date = case
	when hire_date like'%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
	else null 
end;

alter table human_resources 
modify column hire_date date;
describe human_resources;

-- cleaning 'termdate' column and adjusting proper column type
update human_resources 
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate != '';

-- handling empty strings and converting them to NULL 
update human_resources hr 
set termdate = null
where termdate = '';

alter table human_resources 
modify column termdate date;

-- add new column 'age' 
alter table human_resources 
add column age int;

-- employee age calculation
update human_resources hr 
set age = timestampdiff(year, hr.birthdate, CURDATE());

select birthdate, age from human_resources hr ;

/*evaluating the 'birthdate' column with incorrectly written dates
 >>>  967 incorrect dates
 */
select 
	birthdate
	,age
from human_resources hr 
where year(birthdate) >= 2026; 

/*Check the age rage of employee  
 * >>> The range of employee is between  -44 do 59
 */
select 
	min(age) as min_age_empolyee
	,max(age) as max_age_empolyee
from human_resources hr; 

/*count number of employee under 18 years old 
>> There is 967 (underage) that can be removed from further analysis
*/

select 
	count(age) underage_employee
from human_resources hr 
where age <18;

-- enable sql_safe_updates   
set sql_safe_updates =1;
