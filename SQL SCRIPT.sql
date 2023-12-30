SELECT * FROM test2.market_and_customer_analytics_dataset;

SELECT region , COUNT(*) as population
FROM test2.market_and_customer_analytics_dataset
GROUP BY 1  
order by 2 desc;

SELECT region , COUNT(*) as people_who_have_bikes
FROM test2.market_and_customer_analytics_dataset
WHERE Purchased_Bike = 'Yes'
GROUP BY 1  
ORDER BY 2 desc;

SELECT region , count(*) as people_who_have_cars
FROM test2.market_and_customer_analytics_dataset
WHERE Cars > 0 
GROUP BY 1 
order by 2 desc;



SELECT d.region , COUNT(*) as population , people_who_have_cars, people_who_have_bikes
FROM test2.market_and_customer_analytics_dataset d

JOIN (SELECT region , COUNT(*) as people_who_have_bikes
FROM test2.market_and_customer_analytics_dataset
WHERE Purchased_Bike = 'Yes'
GROUP BY 1  
ORDER BY 2 desc) b
ON d.region = b.region

JOIN (SELECT region , count(*) as people_who_have_cars
FROM test2.market_and_customer_analytics_dataset
WHERE Cars > 0 
GROUP BY 1 
order by 2 desc) c
ON d.region = c.region

GROUP BY 1  
order by 2 desc;

SELECT region , CEIL(AVG(Children))
FROM test2.market_and_customer_analytics_dataset
GROUP BY 1 
order by 2 desc;

SELECT region , AVG(Income) as average_income
FROM test2.market_and_customer_analytics_dataset
GROUP BY 1 
order by 2 desc;

SELECT region , Commute_Distance, COUNT(*) as frequency
FROM test2.market_and_customer_analytics_dataset
GROUP BY 1 ,2
order by 1;


SELECT gender, Occupation , count(*)
FROM test2.market_and_customer_analytics_dataset
WHERE region = 'Europe' AND Purchased_Bike = 'Yes' AND Cars = 0
GROUP BY 1,2
ORDER BY 1; 

SELECT Martial_Status , count(*)
FROM test2.market_and_customer_analytics_dataset
WHERE region = 'Europe' AND Purchased_Bike = 'Yes' AND Cars = 0
GROUP BY 1
;

SELECT avg(income)
FROM test2.market_and_customer_analytics_dataset
WHERE region = 'Europe' AND Purchased_Bike = 'No' AND Cars > 0 ; 


SELECT gender, count(*) as count
FROM test2.market_and_customer_analytics_dataset
WHERE region = 'Europe' AND Purchased_Bike = 'Yes' AND Cars = 0
GROUP BY 1 ; 

SELECT gender, martial_status ,count(*) as count
FROM test2.market_and_customer_analytics_dataset
WHERE region = 'Europe' AND Purchased_Bike = 'Yes' AND Cars = 0
GROUP BY 1,2
ORDER BY 1,2; 

SELECT gender, martial_status ,F(avg(children)) as count
FROM test2.market_and_customer_analytics_dataset
WHERE region = 'Europe' AND Purchased_Bike = 'Yes' AND Cars = 0
GROUP BY 1,2
ORDER BY 1,2; 

SELECT gender, martial_status, Commute_Distance , count(*) as frequency
FROM test2.market_and_customer_analytics_dataset
WHERE region = 'Europe' AND Purchased_Bike = 'Yes' AND Cars = 0 
GROUP BY 1,2,3
ORDER BY 1,2; 

SELECT gender, martial_status, occupation , COUNT(*) as No_of_people
FROM test2.market_and_customer_analytics_dataset
WHERE region = 'Europe' AND Purchased_Bike = 'Yes' AND Cars = 0 AND gender = 'Female' AND martial_status = 'married'
GROUP BY 1,2,3
ORDER BY 1,2; 

SELECT gender, martial_status, occupation , avg(income) as Average_Annual_Income
FROM test2.market_and_customer_analytics_dataset
WHERE region = 'Europe' AND Purchased_Bike = 'Yes' AND Cars = 0 AND gender = 'Female' AND martial_status = 'married'
GROUP BY 1,2,3
ORDER BY 1,2; 
