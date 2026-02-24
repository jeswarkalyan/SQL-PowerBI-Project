use kalyan;
show tables;
select count(*) from little_messy_employee_dataset ;
desc project;

select * from little_messy_employee_dataset;
drop table project;
alter table little_messy_employee_dataset rename to project;

select * from project;

desc project;

alter table project add column Full_Name varchar(100) after employee_id;

set sql_safe_updates=0;

update project set Full_Name=concat(first_name,' ',last_name);

alter table project drop column first_name,drop column last_name;

update project set age=24 where age='';

UPDATE project
SET age = CAST(age AS DECIMAL(10,2));

ALTER TABLE project
MODIFY age INT;


select * from project;
alter table project add column Region varchar(100) after department_region;
ALTER TABLE project ADD COLUMN department VARCHAR(50) after department_region;
ALTER TABLE project ADD COLUMN last_name VARCHAR(50);

UPDATE project
SET 
  department = SUBSTR(department_region, 1, LOCATE('-', department_region) - 1),
  region  = SUBSTR(department_region, LOCATE('-', department_region) + 1);

select * from project;

alter table project drop department_region;

desc project;

select distinct join_date from project;

update project  set phone = abs(phone);

update project set remote_work = 'yes' where remote_work='True';

update project set remote_work = 'no' where remote_work='False';

UPDATE project
SET join_date = CASE
    WHEN join_date LIKE '%/%/%' THEN DATE_FORMAT(STR_TO_DATE(join_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN join_date LIKE '%-%-%' THEN DATE_FORMAT(STR_TO_DATE(join_date, '%d-%m-%Y'), '%Y-%m-%d')
    WHEN join_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN join_date
    ELSE NULL
END;

alter table project modify join_date date not null;

select * from project;

desc project;






