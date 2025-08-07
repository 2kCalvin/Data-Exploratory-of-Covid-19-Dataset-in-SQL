-- Exploritory data analysis

SELECT *
FROM layoffs_staging2;


SELECT MAX(total_laid_off), max(percentage_laid_off)
FROM layoffs_staging2;


SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
order by funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
group by company
order by 2 desc;

SELECT location, SUM(total_laid_off)
FROM layoffs_staging2
group by location
order by 2 desc;





SELECT min(`date`), max(`date`)
FROM layoffs_staging2;

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
group by industry
order by 2 desc;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
group by country
order by 2 desc;


SELECT YEAR (`date`), SUM(total_laid_off)
FROM layoffs_staging2
group by YEAR (`date`)
order by 1 desc;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
group by stage
order by 2 desc;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
group by company
order by 2 desc;

SELECT company, YEAR (`date`), SUM(total_laid_off)
FROM layoffs_staging2
group by company, YEAR (`date`)
ORDER BY 3 desc;

WITH company_year (company,years, total_laid_off) AS
(
SELECT company, YEAR (`date`), SUM(total_laid_off)
FROM layoffs_staging2
group by company, YEAR (`date`)
), company_year_rank as 
(SELECT *, 
dense_rank() over(partition by YEARS ORDER BY total_laid_off DESC ) AS RANKING
FROM company_year
WHERE years IS NOT NULL
)
SELECT *
FROM company_year_rank
WHERE ranking <= 5;









