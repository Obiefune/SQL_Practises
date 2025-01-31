-- Exploratory  Data Analyis 

SELECT * FROM layoffs_staging_01;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging_01; 

SELECT * FROM layoffs_staging_01
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off) 
FROM layoffs_staging_01
GROUP BY company
ORDER BY 2 DESC;

SELECT  MIN(`date`) AS start_date, MAX(`date`) AS end_date from layoffs_staging_01;

SELECT industry, SUM(total_laid_off) 
FROM layoffs_staging_01
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off) total_laid_off
FROM layoffs_staging_01
GROUP BY country 
ORDER BY 2 DESC;

SELECT stage, SUM(total_laid_off) 
FROM layoffs_staging_01
GROUP BY stage
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off) total_laid_off
FROM layoffs_staging_01
GROUP BY country 
ORDER BY 2 DESC;


SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)  
FROM layoffs_staging_01
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY `MONTH` ASC;

WITH Rolling_Total AS 
(SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)  AS total_off
FROM layoffs_staging_01
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY `MONTH` ASC)

SELECT `MONTH`, total_off,
SUM(total_off) OVER(ORDER BY `MONTH`) as rolling_total
FROM Rolling_Total;

SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) FROM layoffs_staging_01
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

WITH laidoff_ranking AS 
(SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) FROM layoffs_staging_01
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC)

SELECT *, DENSE_RANK()

