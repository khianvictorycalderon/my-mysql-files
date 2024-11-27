
-- SQL Expresisons

/*

 An expression is a combination of one or more values, operators, 
 and SQL functions that evaluate to a value.
 
 SQL EXPRESSIONs are like formulas and they are written in query language. 
 You can also use them to query the database for specific set of data.

*/


-- Numeric Expression
SELECT (15 + 6) AS numbers_sum;
SELECT POWER(42, 2) AS `squared`,
       (100 / 10) AS `quotient`;
SELECT COUNT(*) AS number_of_rows FROM employees;

-- Date expression
SELECT CURRENT_TIMESTAMP;