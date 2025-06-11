-- Total Customer Per Education Level
-- Count how many customeres belong to each EducationLevel.

SELECT EducationLevel,COUNT(CustomerKey) as Count FROM customers 
GROUP BY EducationLevel;

-- Top 5 Occupations by Customer Count 
-- Return the top 5 most common occupations from the Customers Table. 

SELECT distinct Occupation,COUNT(CustomerKey) as count 
FROM customers 
group by Occupation 
order by Occupation desc  
limit 5;

-- Find all Customers who are HomeOwners and have more than 2 children 

SELECT * FROM Customers 
WHERE HomeOwner='Y' & TotalChildren >2;

-- List Customers Born After 1990. 

SELECT * FROM Customers 
where YEAR(BirthDate) > 1990;

-- Find all female customers who are not married 
SELECT * FROM Customers 
WHERE MaritalStatus = 'S';


