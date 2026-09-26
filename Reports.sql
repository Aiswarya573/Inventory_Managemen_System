SELECT
    product_name,
    stock_quantity,
    reorder_level
FROM products
WHERE stock_quantity <= reorder_level;

SELECT
    product_name,
    unit_price,
    stock_quantity,
    unit_price * stock_quantity AS inventory_value
FROM products;

SELECT
    SUM(unit_price * stock_quantity) AS total_inventory_value
FROM products;



