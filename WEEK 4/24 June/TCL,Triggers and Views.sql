-- Create the database
CREATE DATABASE onlinestoresystem;

USE onlinestoresystem;

-- Products - product_id, name, description, price, stock
CREATE TABLE products
(
    product_id INT(3) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT(5)
);

-- Customers - customer_id, name, age, address
CREATE TABLE customers
(
    customer_id INT(3) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT(3),
    address VARCHAR(100)
);

-- Orders - order_id, customer_id, product_id, order_date, delivery_date
CREATE TABLE orders
(
    order_id INT(3) PRIMARY KEY,
    customer_id INT(3),
    product_id INT(3),
    order_date DATE,
    delivery_date DATE,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- Payments - payment_id, order_id, amount, mode, status
CREATE TABLE payments
(
    payment_id INT(3) PRIMARY KEY,
    order_id INT(3),
    amount DECIMAL(10, 2) NOT NULL,
    mode VARCHAR(30) CHECK(mode IN('cash','credit card','digital')),
    status VARCHAR(30),
    FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

-- Insert values into products table
INSERT INTO products VALUES(1, 'Smartphone', 'Latest model smartphone with advanced features', 699.00, 50);
INSERT INTO products VALUES(2, 'Laptop', 'High performance laptop for work and gaming', 999.00, 30);
INSERT INTO products VALUES(3, 'Headphones', 'Wireless headphones with noise cancellation', 199.00, 100);

-- Insert values into customers table
INSERT INTO customers VALUES(301, 'John Doe', 28, '123 Elm Street');
INSERT INTO customers VALUES(302, 'Jane Smith', 35, '456 Maple Avenue');
INSERT INTO customers VALUES(303, 'Sam Wilson', 22, '789 Oak Lane');

-- Insert values into orders table
INSERT INTO orders VALUES(3001, 301, 1, '2024-06-01', '2024-06-05');
INSERT INTO orders VALUES(3002, 302, 2, '2024-06-05', '2024-06-10');
INSERT INTO orders VALUES(3003, 303, 3, '2024-06-10', '2024-06-15');

-- Insert values into payments table
INSERT INTO payments VALUES(1, 3001, 699.00, 'cash', 'completed');
INSERT INTO payments VALUES(2, 3002, 999.00, 'credit card', 'completed');
INSERT INTO payments VALUES(3, 3003, 199.00, 'digital', 'pending');

-- TCL Commands
-- 1) Commit
START TRANSACTION;
INSERT INTO products (product_id, name, description, price, stock) VALUES (4, 'Tablet', 'Portable tablet with high-resolution display', 499.00, 25);
COMMIT;

-- 2) Rollback
START TRANSACTION;
INSERT INTO products (product_id, name, description, price, stock) VALUES (5, 'Smartwatch', 'Wearable smartwatch with fitness tracking', 199.00, 40);
ROLLBACK;

-- 3) Savepoint
START TRANSACTION;
INSERT INTO products (product_id, name, description, price, stock) VALUES (6, 'Gaming Console', 'Latest gaming console with 4K support', 399.00, 15);
SAVEPOINT sp1;
ROLLBACK TO sp1;

-- Triggers
-- 1) Trigger to update stock after a product is ordered
DELIMITER //
CREATE TRIGGER update_stock_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - 1
    WHERE product_id = NEW.product_id;
END //
DELIMITER ;

-- 2) Trigger to check stock availability before ordering
DELIMITER //
CREATE TRIGGER check_stock_before_order
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE available_stock INT;
    SELECT stock INTO available_stock FROM products WHERE product_id = NEW.product_id;
    IF available_stock < 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for this product';
    END IF;
END //
DELIMITER ;

-- 3) Trigger to automatically update payment status after order is completed
DELIMITER //
CREATE TRIGGER update_payment_status_after_order
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
    IF NEW.status IS NULL THEN
        SET NEW.status = 'Pending';
    END IF;
END //
DELIMITER ;

-- 4) Trigger to prevent deletion of a product if it is currently ordered
DELIMITER //
CREATE TRIGGER prevent_product_deletion
BEFORE DELETE ON products
FOR EACH ROW
BEGIN
    DECLARE order_count INT;
    SELECT COUNT(*) INTO order_count FROM orders WHERE product_id = OLD.product_id;
    IF order_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete product as it is currently ordered';
    END IF;
END //
DELIMITER ;

-- Views
-- 1) Create a view that displays the customers with their corresponding ordered products
CREATE VIEW CustomerOrderedProducts AS
SELECT c.customer_id, c.name, p.product_id, o.name AS product_name, o.order_date, o.delivery_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id;

-- 2) Create or replace view to show payment details with order and customer information
CREATE OR REPLACE VIEW PaymentDetails AS
SELECT pay.payment_id, pay.order_id, o.customer_id, c.name, c.age, c.address, pay.amount, pay.mode, pay.status
FROM payments pay
JOIN orders o ON pay.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id;

-- 3) Drop view if it exists
DROP VIEW IF EXISTS PaymentDetails;
