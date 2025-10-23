select * from [pizza_sales.csv]

--- Total Revenue:

SELECT SUM(total_price) AS Total_Revenue FROM [pizza_sales.csv]

---Average Order Value:

SELECT SUM(total_price) / COUNT(distinct order_id) AS Average_Order_value FROM [pizza_sales.csv]

---Total Pizzas Sold

SELECT SUM(QUANTITY) AS Total_Pizza_Sold FROM [pizza_sales.csv]

---Total Order

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM [pizza_sales.csv]

---Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS Avg_Pizzas_Per_Order FROM [pizza_sales.csv]

---Daily Trend For Total Orders

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM [pizza_sales.csv]
GROUP BY DATENAME(DW, order_date)

--- Monthly Trend for Total Orders

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza_sales.csv]
GROUP BY DATENAME(MONTH, order_date) 
ORDER BY Total_Orders DESC 

---Total Sales

SELECT Pizza_category,SUM(total_price) AS Total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [pizza_sales.csv]) AS PCT
FROM [pizza_sales.csv] 
GROUP BY pizza_category  

---Total Sales for Month of January

SELECT Pizza_category,SUM(total_price) AS Total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [pizza_sales.csv]) AS PCT
FROM [pizza_sales.csv] 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category  

---Percentage of Sales by Pizza Size

SELECT pizza_size, CAST(sum(total_price) AS DECIMAL(10,2)) AS Total_sales, CAST(sum(total_price) * 100 / 
(SELECT sum(total_price) from [pizza_sales.csv]) AS DECIMAL(10,2)) AS PCT 
from [pizza_sales.csv] 
GROUP BY pizza_size 
ORDER BY PCT DESC

---Total Pizza Sold by Pizza Category 

SELECT pizza_category, sum(quantity) AS Total_quantity_sold
from [pizza_sales.csv] 
WHERE MONTH( order_date) = 2
GROUP BY pizza_category
ORDER BY Total_quantity_sold DESC

--- Top 5 Pizzas by Revenue

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [pizza_sales.csv]
GROUP BY Pizza_name 
ORDER BY Total_Revenue DESC

---Top 5 Pizzas by Quantity

SELECT Top 5 pizza_name, SUM(quantity) AS Total_pizza_sold
FROM [pizza_sales.csv]
GROUP BY Pizza_name
ORDER BY Total_Pizza_Sold DESC 

---Bottom 5 Pizzas by Quantity

SELECT TOP 5 pizza_name, SUM(Quantity) AS Total_pizza_sold
FROM [pizza_sales.csv]
GROUP BY Pizza_name
ORDER BY Total_pizza_sold ASC

---Top 5 Pizzas by Toral Orders

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_orders
FROM [pizza_sales.csv]
GROUP BY pizza_name
ORDER BY Total_orders DESC

---	Bottom 5 Pizzas by Total Orders

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_orders
FROM [pizza_sales.csv]
GROUP BY pizza_name
ORDER BY Total_orders ASC

