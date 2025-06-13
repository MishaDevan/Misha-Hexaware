create database Ecomm

CREATE TABLE customers (customer_id INT PRIMARY KEY, name NVARCHAR(100) NOT NULL, email NVARCHAR(100) UNIQUE NOT NULL, password NVARCHAR(100) NOT NULL);
CREATE TABLE products (product_id INT PRIMARY KEY, name NVARCHAR(100) NOT NULL, price DECIMAL(10,2) NOT NULL, description NVARCHAR(255), stock_quantity INT NOT NULL);
CREATE TABLE cart (cart_id INT PRIMARY KEY, customer_id INT NOT NULL, product_id INT NOT NULL, quantity INT NOT NULL, FOREIGN KEY (customer_id) REFERENCES customers(customer_id), FOREIGN KEY (product_id) REFERENCES products(product_id));
CREATE TABLE orders (order_id INT PRIMARY KEY, customer_id INT NOT NULL, order_date DATETIME NOT NULL, total_price DECIMAL(10,2) NOT NULL, shipping_address NVARCHAR(255) NOT NULL, FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
CREATE TABLE order_items (order_item_id INT PRIMARY KEY, order_id INT NOT NULL, product_id INT NOT NULL, quantity INT NOT NULL, FOREIGN KEY (order_id) REFERENCES orders(order_id), FOREIGN KEY (product_id) REFERENCES products(product_id));

