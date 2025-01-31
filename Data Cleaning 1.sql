SELECT * FROM layoffs;

CREATE TABLE layoffs_staging like layoffs;
INSERT layoffs_staging SELECT * FROM layoffs;
SELECT * FROM layoffs_staging;

SELECT *, ROW_NUMBER() OVER(PARTITION BY company, location, industry, 
total_laid_off, percentage_laid_off, `date`,
stage, country, funds_raised_millions) as row_num FROM layoffs_staging;

CREATE TABLE `layoffs_staging1` (
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
INSERT INTO layoffs_staging1 
SELECT *, ROW_NUMBER() OVER(PARTITION BY company, location, industry, 
total_laid_off, percentage_laid_off, `date`,
stage, country, funds_raised_millions) as row_num FROM layoffs_staging;

DELETE FROM layoffs_staging1
WHERE row_num > 1;

SELECT * FROM layoffs_staging1;

SELECT company, TRIM(company) FROM Layoffs_staging1;

UPDATE layoffs_staging1 SET company = TRIM(company);

SELECT * FROM layoffs_staging1 WHERE industry LIKE 'Crypto%';
UPDATE layoffs_staging1 SET industry = 'Crypto' 
WHERE industry LIKE 'Crypto%';

SELECT country FROM layoffs_staging1;

UPDATE layoffs_staging1 SET country = 'United State'
WHERE country LIKE 'United States%';

SELECT `date`, STR_TO_DATE(`date`, '%m/%d/%Y') FROM layoffs_staging1;
UPDATE layoffs_staging1 SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');
SELECT `date` FROM layoffs_staging1;

SELECT * FROM layoffs_staging1;

ALTER TABLE layoffs_staging1
MODIFY COLUMN `date` DATE;



