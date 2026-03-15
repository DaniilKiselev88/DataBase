-- 1. Общая выручка за месяц
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_revenue
FROM Orders
WHERE status = 'completed'
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- 2. Топ‑5 самых продаваемых товаров
SELECT
    p.name AS product_name,
    p.category,
    SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name, p.category
ORDER BY total_sold DESC
LIMIT 5;

-- 3. Средний чек по городам
SELECT
    c.city,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.city;

-- 4. Конверсия заказов (доля завершённых)
SELECT
    ROUND((COUNT(CASE WHEN status = 'completed' THEN 1 END) * 100.0 / COUNT(*)), 2) AS conversion_rate_percent
FROM Orders;

-- 5. Выручка по категориям товаров
SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Orders o ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 6. Клиенты с наибольшим количеством баллов лояльности
SELECT
    first_name,
    last_name,
    email,
    loyalty_points
FROM Customers
ORDER BY loyalty_points DESC
LIMIT 10;

-- 7. Товары с низким запасом (< 10 шт.)
SELECT
    name,
    category,
    stock_quantity
FROM Products
WHERE stock_quantity < 10
ORDER BY stock_quantity;

-- 8. Количество заказов по статусам
SELECT
    status,
    COUNT(*) AS order_count
FROM Orders
GROUP BY status;
