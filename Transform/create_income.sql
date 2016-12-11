----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Elizabeth Shulok
-- File name   : create_income.sql
-- Description :
-- Date Created: 11/6/2016
-- Modified    : 11/10/2016 - VC: fixed transformation of county_name 
----------------------------------------------------------------------------
DROP TABLE income;

CREATE TABLE income AS
SELECT DISTINCT 
IF(instr(county_name, ' County, California') > 0, 
  UPPER(substring(county_name, 1, instr(county_name, ' County, California') - 1)),  
  'UNKNOWN') AS county_name, 
cast(2014_income AS DOUBLE) AS 2014_income
FROM income_raw;