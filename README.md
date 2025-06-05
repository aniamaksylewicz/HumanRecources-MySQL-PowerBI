# HumanResources -MySQL-PowerBI

## HR -Dashboard -MySQL - PowerBI

![HR_dashboard_part1](https://github.com/user-attachments/assets/65291798-430f-44ea-9c78-364be1550462)

## Project Overview
This project aims to analyze the demographic/gender/age/geographic distribution, employtment patterns and work staff trends within the organisation using employee data stored in SQL database.
The dataset includes detailed information such as employee ID, department, job role, employment status, hire and termination dates, age, gender, race, location, and work modality (remote vs on-site).

## Data Source
- Data Source - Human Resources Dataset from from Her Data Project (HumenResources.csv).
- Dataset contains 22,214 rows covering years from 2001 to 2020.
 
## Tools
- Data Cleaning and Analysis - MySQL Workbench, Excel
- Data Visualisation - PowerBI

##  Exploratory Data Analysis
   EDA involed HR data to answear questions such as:
1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age group distribution of employees in the company?
4. What is gender distribution among age group of employees in the company?
5. How many employees work at headquarters versus remote locations? 
6. How does the gender distribution vary across departments?
7. What is the distribution of job titles across the company?
8. What is the distribution of employees across state?
9. What is the average length of employment for employees who have been terminated?
10. What is the avarage employment time among departments?
11. Which department has the highest turnover rate?
12. How has the company's employee count changed over time based on hire and term dates?


## Summary of Findings

1.	Most employees are White, while the least represented racial group is Native Hawaiian and other Pacific Islander.
2.	Ohio is the state with the highest number of employees.
3.	More than 70% of employees work at the headquarters, while 25% are remote workers.
4.	The average employment duration for terminated employees is 8 years. Sales and Marketing Department has the longest average employment time (9years), whereas Product Management and Legal departments have the shortest (7years).
5.	The hiring analysis covers the period from 2001 to 2020. Over this time, there has been a noticeable increase in employee count rising from 82% in 2001 to 96% in 2020, indicating company growth.
6.	At the time of analysis (2025), the youngest employee is 22 years old and the oldest is 59 years old.
   All employees are categorised into five groups. The 35-44 age group is the most represented, while the 18-24 and 55+ age groups have the fewest employees. In all age group male employees outnumber female employees.
8.	Engineering Department employs the highest amount of people.
9.	Most departments have slightly more male than female employees, except for Research and Development and Auditing departments, where the number of female employees is equal or slightly higher than male employees.
10.	Auditing Department has the highest turnover rate (0.2), indicating a high level of employee rotation. Conversely Marketing Department is the most stable, with the lowest turnover rate (0.1) in the company.

## Limitations
- Dataset have some record with negative ages where date_of_birth is written above year 2026 (967 records). Such records were exluded from analysis. Ages used were 18 year old and older.
- Dataset also have termdate with incorectly writen  records with termdate above year 2026 (1139 records). Such values also were exluded. Termdates left were only for those with less than or equal to currrent date.
