use btvn25042026;
-- 1
SELECT SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'completed';
-- 2
SELECT c.category_name        AS ten_danh_muc,
       COUNT(p.product_id)    AS so_luong_sp,
       AVG(p.price)           AS gia_trung_binh
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;
-- 3
SELECT cu.customer_name              AS ten_khach,
       SUM(oi.quantity * oi.unit_price) AS tong_tien_da_chi
FROM customers cu
JOIN orders o      ON cu.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY cu.customer_id, cu.customer_name
HAVING SUM(oi.quantity * oi.unit_price) > 500000;
-- 4
SELECT p.product_id,
       p.product_name,
       p.price
FROM products p
WHERE p.price > (
    SELECT AVG(price)
    FROM products
);
