SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.unit_price,
    p.stock_quantity,
    p.reorder_level,
    p.unit_price * p.stock_quantity AS inventory_value
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN suppliers s
    ON p.supplier_id = s.supplier_id
ORDER BY inventory_value DESC;

SELECT
    p.product_name,
    c.category_name,
    p.stock_quantity,
    p.reorder_level,
    CASE
        WHEN p.stock_quantity = 0 THEN 'Out of Stock'
        WHEN p.stock_quantity <= p.reorder_level THEN 'Low Stock'
        ELSE 'In Stock'
    END AS stock_status
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
WHERE p.stock_quantity <= p.reorder_level
ORDER BY p.stock_quantity;

SELECT COUNT(*) AS total_products
FROM products;

SELECT SUM(stock_quantity) AS total_stock
FROM products;

SELECT
    SUM(unit_price * stock_quantity) AS total_inventory_value
FROM products;

SELECT COUNT(*) AS low_stock_products
FROM products
WHERE stock_quantity <= reorder_level;

SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products,
    SUM(p.stock_quantity) AS total_stock,
    SUM(p.unit_price * p.stock_quantity) AS inventory_value
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY inventory_value DESC;

SELECT
    s.supplier_name,
    COUNT(p.product_id) AS total_products,
    SUM(p.stock_quantity) AS total_stock
FROM suppliers s
LEFT JOIN products p
    ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name
ORDER BY total_products DESC;

SELECT
    transaction_type,
    SUM(quantity) AS total_quantity
FROM stock_transactions
GROUP BY transaction_type;

