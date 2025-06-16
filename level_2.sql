use codingninjas; -- using database codingninjas for solving these questions.

-- Join Sales and Products to find top 5 selling products 

SELECT *
FROM codingninjas.products p
JOIN codingninjas.`sales-2015` s15 -- joining all sales table doesn't give any answer.
  ON p.ProductKey = s15.ProductKey 
ORDER BY ProductPrice 
LIMIT 5;

-- Get Return Rate per Product (Returned qty/Sold qty)  
SELECT 
    s.ProductKey,
    ROUND(r.TotalReturnQty / s.TotalSoldQty, 2) AS return_rate
FROM 
    (
        SELECT ProductKey, SUM(OrderQuantity) AS TotalSoldQty
        FROM codingninjas.`sales-2015`
        GROUP BY ProductKey
    ) s
LEFT JOIN 
    (
        SELECT ProductKey, SUM(ReturnQuantity) AS TotalReturnQty
        FROM codingninjas.returns
        GROUP BY ProductKey
    ) r ON s.ProductKey = r.ProductKey;

-- Average Order Quantity per Territory in 2016 
select avg(OrderQuantity) as avg from codingninjas.`sales-2016`;

-- Product Categories with no sales in 2016.

select pc.CategoryName from codingninjas.`product-categories` pc
where pc.ProductCategoryKey not in ( 
select distinct pc.CategoryName from codingninjas.`product-categories` pc
join codingninjas.`product-subcategories` psc 
on pc.ProductCategoryKey = psc.ProductCategoryKey 
join codingninjas.`products` p 
on psc.ProductSubcategoryKey = p.ProductSubcategoryKey 
join codingninjas.`sales-2016` s 
on p.ProductKey = s.ProductKey 
);

-- Find No of Customers Who Made Purchases in All Three Years (2015–2017) 
select count(*) as count_of_customers from customers c 
join codingninjas.`sales-2015` s15 
on c.CustomerKey = s15.CustomerKey 
join codingninjas.`sales-2016` s16 
on s15.CustomerKey = s16.CustomerKey 
join codingninjas.`sales-2017` s17 
on s16.CustomerKey = s17.CustomerKey ;