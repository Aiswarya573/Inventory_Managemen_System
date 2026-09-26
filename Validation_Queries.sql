SELECT *
FROM products
WHERE unit_price < 0;

SELECT *
FROM products
WHERE stock_quantity < 0;

SELECT *
FROM products
WHERE product_name IS NULL
   OR product_name = '';

SELECT
    product_name,
    COUNT(*) AS duplicate_count
FROM products
GROUP BY product_name
HAVING COUNT(*) > 1;

SELECT *
FROM stock_transactions
WHERE transaction_type NOT IN ('IN', 'OUT');

SELECT *
FROM stock_transactions
WHERE quantity <= 0;

