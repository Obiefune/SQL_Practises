CREATE TABLE layoffs_staging 
LIKE layoffs;
SELECT * FROM layoffs_staging;
INSERT layoffs_staging 
SELECT * FROM layoffs;

WITH layoffs_CTE as  
(SELECT *, ROW_NUMBER () OVER ( PARTITION BY company, location, industry, 
total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) as row_num
FROM layoffs_staging as agg_tble)

SELECT * FROM layoffs_CTE 
WHERE row_num > 1;

CREATE TABLE `layoffs_staging_01` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT layoffs_staging_01 SELECT *, ROW_NUMBER () 
OVER(PARTITION BY company, location, industry, 
total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) as row_num
FROM layoffs_staging as agg_tble;

SELECT * FROM layoffs_staging_01;

DELETE FROM layoffs_staging_01
WHERE row_num > 1;

SELECT company, location, industry, 
stage, country, 
TRIM(company), 
TRIM(location), 
TRIM(industry), 
TRIM(stage), 
TRIM(country) 
FROM layoffs_staging_01;

UPDATE layoffs_staging_01 SET 
company = TRIM(company), 
location = TRIM(location), 
industry = TRIM(industry), 
stage = TRIM(stage), 
country = TRIM(country);

SELECT `date`, STR_TO_DATE(`date`, '%m/%d/%Y') as `date` from layoffs_staging_01;

UPDATE layoffs_staging_01 SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging_01
MODIFY COLUMN `date` DATE;

SELECT DISTINCT industry FROM layoffs_staging_01
ORDER BY 1;

UPDATE layoffs_staging_01 
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country FROM layoffs_staging_01 ORDER BY 1;

UPDATE layoffs_staging_01 
SET country = 'United State'
WHERE country LIKE 'United State%';

SELECT * FROM layoffs_staging_01
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

UPDATE layoffs_staging_01 
SET industry = NULL 
WHERE industry = '';

SELECT * FROM layoffs_staging_01
WHERE company = 'Airbnb';


SELECT t1.industry, t2.industry FROM layoffs_staging_01 t1 
JOIN layoffs_staging_01 t2 
ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging_01 t1
JOIN layoffs_staging_01 t2 
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

DELETE FROM layoffs_staging_01
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

SELECT * FROM layoffs_staging_01;

ALTER TABLE layoffs_staging_01
DROP COLUMN row_num;





