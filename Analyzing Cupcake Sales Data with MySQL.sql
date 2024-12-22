
-- *Analyzing Cupcake Sales Data with MySQL*


-- 1. Find the unique flavors
SELECT DISTINCT Cupcake_Flavor
FROM Cupcake_Sales_Data;

-- **Distinctive Flavors:** Coffee, Chocolate, Caramel, Strawberry, Carrot, Red Velvet, Almond, Mango Tango, Pineapple, Coconut, Banana Nut, and Vanilla.


-- 2. Find the revenue per flavor
SELECT Cupcake_Flavor, SUM(Quantity * Unit_Price) AS Revenue
FROM Cupcake_Sales_Data
GROUP BY Cupcake_Flavor;

-- **Flavor Revenue Breakdown**: The revenue generated per flavor is as follows: Coffee - 1,683,000; Chocolate - 1,608,000; Caramel - 1,148,000; Strawberry - 1,818,000; Carrot - 1,057,000; Red Velvet - 1,953,000; Almond - 1,557,000; Mango Tango - 578,000; Pineapple - 1,385,500; Coconut - 1,656,000; Banana Nut - 1,785,000; Vanilla - 518,000

-- 3. Total Revenue for the year 2023
SELECT SUM(Quantity * Unit_Price) AS Total_Revenue_2023
FROM Cupcake_Sales_Data
WHERE YEAR(STR_TO_DATE(Order_Date, '%d-%b-%y')) = 2023;

-- **Total Revenue for 2023**: The cumulative revenue for the year 2023 stands at an impressive 16,746,500


-- 4. Which month has the highest sales?
SELECT MONTH(STR_TO_DATE(Order_Date, '%d-%b-%y')) AS Month, SUM(Quantity * Unit_Price) AS Total_Sales
FROM Cupcake_Sales_Data
WHERE YEAR(STR_TO_DATE(Order_Date, '%d-%b-%y')) = 2023
GROUP BY Month
ORDER BY Total_Sales DESC
LIMIT 1;

-- **Peak Sales Month**: The highest sales were recorded in February (2), with a remarkable total of 4,910,500


-- 5. Which flavor sells most during this month?
SELECT Cupcake_Flavor, SUM(Quantity) AS Total_Sold
FROM Cupcake_Sales_Data
WHERE MONTH(STR_TO_DATE(Order_Date, '%d-%b-%y')) = 2 AND YEAR(STR_TO_DATE(Order_Date, '%d-%b-%y')) = 2023
GROUP BY Cupcake_Flavor
ORDER BY Total_Sold DESC
LIMIT 1;

-- **Top-Selling Product**: Red Velvet has emerged as the most sold-out product, with a staggering total of 17,600 units sold during the month.


-- 6. Which is the most popular flavor?
SELECT Cupcake_Flavor, SUM(Quantity) AS Total_Sold
FROM Cupcake_Sales_Data
GROUP BY Cupcake_Flavor
ORDER BY Total_Sold DESC
LIMIT 1;

-- **Most Popular Flavor**: Red Velvet not only leads in sales but also boasts a remarkable sell-through amount of 21,700 units.


-- 7. Which flavor has the most rating?
SELECT Cupcake_Flavor, AVG(rating) AS Average_Rating
FROM Cupcake_Sales_Data
GROUP BY Cupcake_Flavor
ORDER BY Average_Rating DESC
LIMIT 1;

-- **Highest Rated Flavor**: Vanilla shines as the most highly-rated flavor, achieving an impressive average rating of 4.6667.


-- 8. Is there any relation between rating 5 and revenue?
SELECT SUM(Quantity * Unit_Price) AS Revenue_With_Rating_5
FROM Cupcake_Sales_Data
WHERE rating = 5;

-- **Revenue from Perfect Ratings**: Flavors that received a perfect rating of 5 generated a total revenue of 4,129,000.


-- 9. Top 3 loyal customers
SELECT Customer_Id, SUM(Quantity) AS Total_Quantity
FROM Cupcake_Sales_Data
GROUP BY Customer_Id
ORDER BY Total_Quantity DESC
LIMIT 3;

-- **Top 3 Loyal Customers**: Most loyal customers are identified as follows: C_090 with 12,900, C_056 with 9,100, and C_074 with 6,500 in purchases.


-- 10. From which city are we getting the most orders?
SELECT City, COUNT(Order_ID) AS Total_Orders
FROM Cupcake_Sales_Data
GROUP BY City
ORDER BY Total_Orders DESC
LIMIT 1;

-- **Order Origin**: The highest number of orders was received from Pune, totaling 9 orders.

