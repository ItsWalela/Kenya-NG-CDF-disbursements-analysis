-- Create Database
CREATE DATABASE IF NOT EXISTS NG_CDF_disbursements;

USE ng_cdf_disbursements;

CREATE TABLE ng_cdf_disbursements (
constituency_id int,
constituency varchar(50),
disbursement_date date,
financial_year varchar(50),
amount_kes float
);

-- Cleaning
SELECT 
    *
FROM
    ng_cdf_disbursements;
    
SELECT DISTINCT
    constituency_id
FROM
    ng_cdf_disbursements;
    
SELECT DISTINCT
    constituency
FROM
    ng_cdf_disbursements;
    
SELECT DISTINCT
    disbursement_date
FROM
    ng_cdf_disbursements;

SELECT DISTINCT
    financial_year
FROM
    ng_cdf_disbursements;
-- One disparity where a financial year is 2018/2020

SELECT 
    *
FROM
    ng_cdf_disbursements
WHERE
    financial_year = '2018/2020';
    
SELECT DISTINCT
    constituency,
    constituency_id,
    disbursement_date,
    financial_year,
    amount_kes
FROM
    ng_cdf_disbursements
WHERE
    disbursement_date = '2020-03-20'
        AND constituency_id = '48'
        AND financial_year LIKE '%2020';
        
SELECT DISTINCT
    constituency,
    constituency_id,
    disbursement_date,
    financial_year,
    amount_kes
FROM
    ng_cdf_disbursements
WHERE
    disbursement_date = '2020-03-20'
        AND constituency_id = '22'
        AND financial_year LIKE '%2020';
        
SELECT 
    *
FROM
    ng_cdf_disbursements
WHERE
    financial_year = '2019/2020'
        AND constituency_id IN ('22' , '48')
        AND disbursement_date = '2020-03-20';

-- the error of financial_year 2018/2019 from the queries is supposed to be 2019/2020. For the date 2020-03-20, for the constituency_id 22 and 48, there was no record of financial_year 2019/2020
SET SQL_SAFE_UPDATES = 0;

UPDATE ng_cdf_disbursements 
SET 
    financial_year = '2019/2020'
WHERE
    financial_year = '2018/2020';
    
SELECT 
    *
FROM
    ng_cdf_disbursements;
-- duplicates seen same constituency, date, financial year and amount

SELECT 
    constituency_id,
    constituency,
    disbursement_date,
    financial_year,
    amount_kes,
    COUNT(*) AS row_count
FROM
    ng_cdf_disbursements
GROUP BY constituency_id , constituency , disbursement_date , financial_year , amount_kes
HAVING COUNT(*) > 1;

-- Step 1: Copy only unique records into the copy table
CREATE TABLE copy_ng_cdf_disbursements AS SELECT constituency,
    constituency_id,
    disbursement_date,
    financial_year,
    amount_kes FROM
    ng_cdf_disbursements
GROUP BY constituency , constituency_id , disbursement_date , financial_year , amount_kes;

-- Step 2: Empty the original table containing the duplicates
TRUNCATE TABLE ng_cdf_disbursements;

-- Step 3: Move the clean, unique records back into the original table
INSERT INTO ng_cdf_disbursements (
    constituency, 
    constituency_id, 
    disbursement_date, 
    financial_year, 
    amount_kes
)
SELECT * FROM copy_ng_cdf_disbursements;

-- Step 4: Delete the copy table once verified
DROP TABLE copy_ng_cdf_disbursements;

SELECT 
    *
FROM
    ng_cdf_disbursements
WHERE
    disbursement_date > '2026-07-07';
    
-- There are 959 rows dated after the retrieval date. I decided to leave them because they are they are not dated after the day I downloaded the data and  to many for me to discard. 