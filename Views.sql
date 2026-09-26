CREATE OR REPLACE VIEW public.low_stock_products AS
SELECT
    product_name,
    stock_quantity,
    reorder_level
FROM public.products
WHERE stock_quantity <= reorder_level;

CREATE OR REPLACE VIEW public.inventory_value_report AS
SELECT
    product_id,
    product_name,
    unit_price,
    stock_quantity,
    unit_price * stock_quantity AS inventory_value
FROM public.products;
