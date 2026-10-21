SELECT COUNT(*) FROM ecommerce_sales;

--Calculate Total Sales--
SELECT
    Order_ID,
    Customer_Name,
    Product,
    Quantity,
    Unit_Price,
    Quantity * Unit_Price AS Total_Sales
FROM ecommerce_sales;

--Calculate Total Revenue--
SELECT
    SUM(Quantity * Unit_Price) AS Total_Revenue
FROM ecommerce_sales;

--City-wise Sales Analysis--
SELECT
    City,
    SUM(Quantity * Unit_Price) AS Total_Revenue
FROM ecommerce_sales
GROUP BY City
ORDER BY Total_Revenue DESC;

--Category-wise Sales Analysis--
SELECT
    Category,
    SUM(Quantity * Unit_Price) AS Total_Revenue
FROM ecommerce_sales
GROUP BY Category
ORDER BY Total_Revenue DESC;

--Product-wise Sales Analysis--
SELECT
    Product,
    SUM(Quantity * Unit_Price) AS Total_Revenue
FROM ecommerce_sales
GROUP BY Product
ORDER BY Total_Revenue DESC;

--Monthly Sales Analysis--
SELECT
    EXTRACT(MONTH FROM Order_Date) AS Month_Number,
    TO_CHAR(Order_Date, 'Month') AS Month_Name,
    SUM(Quantity * Unit_Price) AS Total_Revenue
FROM ecommerce_sales
GROUP BY
    EXTRACT(MONTH FROM Order_Date),
    TO_CHAR(Order_Date, 'Month')
ORDER BY Month_Number;

--Top 5 Customers Analysis--
SELECT
    Customer_Name,
    SUM(Quantity * Unit_Price) AS Total_Spending
FROM ecommerce_sales
GROUP BY Customer_Name
ORDER BY Total_Spending DESC
LIMIT 5;

--Monthly Sales Analysis--
SELECT
    TO_CHAR(Order_Date, 'Month') AS Month_Name,
    SUM(Quantity * Unit_Price) AS Total_Revenue
FROM ecommerce_sales
GROUP BY
    EXTRACT(MONTH FROM Order_Date),
    TO_CHAR(Order_Date, 'Month')
ORDER BY
    EXTRACT(MONTH FROM Order_Date);

--Top-Selling Product Analysis--
SELECT
    Product,
    SUM(Quantity) AS Total_Quantity_Sold
FROM ecommerce_sales
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC;

--Average Order Value (AOV)--
SELECT
    AVG(Quantity * Unit_Price) AS Average_Order_Value
FROM ecommerce_sales;

--Highest Revenue Order--
SELECT
    Order_ID,
    Order_Date,
    Customer_Name,
    Product,
    Quantity * Unit_Price AS Total_Sales
FROM ecommerce_sales
ORDER BY Total_Sales DESC
LIMIT 1;

--Final Business Insights--
SELECT
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(Quantity * Unit_Price) AS Total_Revenue,
    ROUND(AVG(Quantity * Unit_Price), 2) AS Average_Order_Value,
    COUNT(DISTINCT Customer_Name) AS Total_Customers
FROM ecommerce_sales;  