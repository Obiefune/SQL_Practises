select * from layoffs;

-- Data Cleaning 
-- 1. Remove Duplicates 
-- 2. Standardize the Data
-- 3. Null Values or Blank Values 
-- 4. Remove Any Column or Row that are unnessary 

CREATE TABLE layoffs_staging
LIKE layoffs;
SELECT * FROM layoffs_staging;
INSERT layoffs_staging 
SELECT * FROM layoffs;