
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