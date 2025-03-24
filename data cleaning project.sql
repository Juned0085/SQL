use world_layoffs;
create database world_layoffs;

-- import dataset


select * from layoffs;

-- 1. remove duplicate
-- 2. standardize the data
-- 3. null values or blank values
-- 4. remove any column 

create table layoffs_staging
like layoffs;

select * from layoffs_staging;

insert into layoffs_staging
select * from layoffs;

with duplicate_row as
(
select * ,
row_number()
over(partition by company, location, industry, total_laid_off, `date`, stage, country, funds_raised_millions)
as row_num 
from
layoffs
)
delete from duplicate_row
where row_num > 1;


CREATE TABLE `layoffs2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num`int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into layoffs2
select * ,
row_number()
over(partition by company, location, industry, total_laid_off, `date`, stage, country, funds_raised_millions)
as row_num 
from
layoffs;

select * from layoffs2;

select * from layoffs2
where row_num > 1;


delete from layoffs2
where row_num > 1;

-- standardization

select * from layoffs2;
select company from layoffs2;

select company,trim(company)
from layoffs2;

update layoffs2
set company = trim(company);

select distinct industry from
layoffs2
order by 1;

select *
from layoffs2
where industry like 'crypto%';



update layoffs2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct location from
layoffs2;

select distinct country from
layoffs2 ;

update layoffs2
set country = 'United State'
where country like 'Unied States';

select `date`,
str_to_date(`date`,'%m/%d/%Y')
from layoffs2;


update layoffs2
set `date`=
str_to_date(`date`,'%m/%d/%Y');

alter table layoffs2
modify column `date` date;

-- remove null values or blank valunes

select *
from layoffs2
where industry is null
or industry = '';

select * from layoffs2
where company like 'Ball%';

update layoffs2
set industry = 'Travel'
where company = 'Airbnb';

select * 
from layoffs2 t1
join layoffs2 t2
	on t1.industry = t2.industry
where(t1.industry is null or t1.industry = '')
and t2.industry is not null;

select industry from layoffs2
order by 1;

update layoffs2
set industry = 'Consumer'
where company = 'Juul';

select * from layoffs2;

select * from
layoffs where total_laid_off is null
and percentage_laid_off is null;

delete from
layoffs where total_laid_off is null
and percentage_laid_off is null;

select * from layoffs2;


-- remove any column
alter table layoffs2
drop column row_num;

select * from layoffs2;
