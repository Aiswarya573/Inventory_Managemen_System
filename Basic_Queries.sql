SELECT *
FROM products;

SELECT product_name, stock_quantity
FROM products;

SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity DESC;

SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity DESC 
LIMIT 5;
SELECT COUNT(*) AS Total_Suppliers FROM suppliers;

SELECT COUNT(*) As Total_Products FROM products;

SELECT COUNT(*) AS Total_Transactions FROM stock_transactions;

SELECT SUM(stock_quantity) AS total_stock
FROM products;