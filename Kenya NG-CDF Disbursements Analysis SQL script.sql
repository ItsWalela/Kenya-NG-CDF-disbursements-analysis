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
SELECT DISTINCT
    constituency_id, constituency, financial_year, amount_kes
FROM
    ng_cdf_disbursements.ng_cdf_disbursements;