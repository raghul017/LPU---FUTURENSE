-- 1) Calculate the total number of orders placed by each client
SELECT client_id, COUNT(*) AS total_orders
FROM orders
GROUP BY client_id;

-- 2) Find the top 5 most expensive items
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- 3) Retrieve clients who have not placed any orders
SELECT c.*
FROM clients c
LEFT JOIN orders o ON c.client_id = o.client_id
WHERE o.order_id IS NULL;

-- 4) Update the inventory level of a product by adding 10 to the current inventory
UPDATE products
SET inventory = inventory + 10
WHERE product_id = 101; -- Example product ID

-- 5) Delete all orders that have not been delivered
DELETE FROM orders
WHERE status = 'not delivered';

-- 6) Retrieve the average order value for each client
SELECT client_id, AVG(amount) AS avg_order_value
FROM orders
GROUP BY client_id;

-- 7) Find the total sales for each month in the current year
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(amount) AS total_sales
FROM orders
WHERE YEAR(order_date) = YEAR(CURDATE())
GROUP BY month;

-- 8) Retrieve the items that have not been ordered in the last 6 months
SELECT *
FROM products p
WHERE NOT EXISTS (
  SELECT 1
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  WHERE oi.product_id = p.product_id
  AND o.order_date > DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
);

-- 9) Find clients who placed more than 3 orders in the last month
SELECT client_id, COUNT(*) AS order_count
FROM orders
WHERE order_date > DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY client_id
HAVING order_count > 3;

-- 10) Retrieve the details of products with prices between 100 and 500
SELECT *
FROM products
WHERE price BETWEEN 100 AND 500;
