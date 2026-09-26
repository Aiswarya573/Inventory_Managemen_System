SELECT
    p.product_name,
    c.category_name,
    p.unit_price,
    p.stock_quantity
FROM products p
JOIN categories c
ON p.category_id = c.category_id;

SELECT
    p.product_name,
    s.supplier_name,
    s.city,
    p.stock_quantity
FROM products p
JOIN suppliers s
ON p.supplier_id = s.supplier_id;

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.unit_price,
    p.stock_quantity,
    p.reorder_level
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN suppliers s
    ON p.supplier_id = s.supplier_id
ORDER BY p.product_name;

SELECT
    c.category_name,
    SUM(p.stock_quantity) AS total_stock
FROM products p
JOIN categories c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_stock DESC;

SELECT
    s.supplier_name,
    COUNT(p.product_id) AS total_products
FROM suppliers s
LEFT JOIN products p
ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name
ORDER BY total_products DESC;

SELECT
    SUM(quantity) AS total_stock_in
FROM stock_transactions
WHERE transaction_type = 'IN';

SELECT
    SUM(quantity) AS total_stock_out
FROM stock_transactions
WHERE transaction_type = 'OUT';

SELECT
    p.product_name,
    st.transaction_type,
    SUM(st.quantity) AS total_quantity
FROM stock_transactions st
JOIN products p
ON st.product_id = p.product_id
GROUP BY
    p.product_name,
    st.transaction_type
ORDER BY p.product_name;

