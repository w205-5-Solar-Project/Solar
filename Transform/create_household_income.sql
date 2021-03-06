----------------------------------------------------------------------------
-- W205 Section 5 Course Project
-- Elizabeth Shulok
-- File name   : create_household_income.sql
-- Description :
-- Date Created: 11/6/2016
-- Modified    : 11/10/2016-VC: fixed transformation of county_name 
--               11/27/2016-VC: change to querying from the 
--                              household_income_raw table
----------------------------------------------------------------------------
DROP TABLE household_income;

CREATE TABLE household_income AS
SELECT DISTINCT 
IF(instr(county_name, ' County, California') > 0, 
  UPPER(substring(county_name, 1, instr(county_name, ' County, California') - 1)),  
  'UNKNOWN') AS county_name, 
cast(2014_income AS DOUBLE) AS 2014_income
FROM household_income_raw;
