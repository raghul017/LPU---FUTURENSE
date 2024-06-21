-- ANOMALIES
-- Update Anomaly: Update the price of a product and see the impact on existing sales
UPDATE Products
SET price = 65000
WHERE product_id = 1;

-- Delete Anomaly: Delete a product and see the impact on existing sales
DELETE FROM Products
WHERE product_id = 5;

-- Insertion Anomaly: Try inserting a sale for a non-existent customer
INSERT INTO Sales (sale_id, customer_id, product_id, quantity)
VALUES (10010, 210, 3, 2);

-- Candidate Keys: Display product information and choose the primary key
SELECT product_id, product_name, price, stock, warehouse_location
FROM Products;

-- Foreign Keys: Join Sales and Customers tables using the foreign key relationship
SELECT s.sale_id, c.customer_name, s.product_id
FROM Sales s
INNER JOIN Customers c ON s.customer_id = c.customer_id
WHERE s.customer_id = 102;

-- 1NF: Example of table adhering to 1NF
CREATE TABLE Products_1NF (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT,
    warehouse_location VARCHAR(50) CHECK(warehouse_location IN ('New York', 'Los Angeles'))
);

-- 2NF: Example of table adhering to 2NF
-- Decomposed Sales table into Sales and Sale_Items
CREATE TABLE Sales_2NF (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Sale_Items (
    sale_item_id INT PRIMARY KEY,
    sale_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (sale_id) REFERENCES Sales_2NF(sale_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 3NF: Example of table adhering to 3NF
-- Decomposed Sales table into Sales and CustomerLocation
CREATE TABLE Sales_3NF (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE CustomerLocation (
    customer_id INT PRIMARY KEY,
    city VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- BCNF: Example of table adhering to BCNF
-- Decomposed Sales table into Sale_Info and Sale_Details
CREATE TABLE Sale_Info (
    sale_id INT PRIMARY KEY,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id)
);

CREATE TABLE Sale_Details (
    sale_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (sale_id, customer_id, product_id),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
