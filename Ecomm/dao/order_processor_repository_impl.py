import pyodbc
import sys
import os


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from dao.order_processor_repository import OrderProcessorRepository
from exception.order_not_found_exception import OrderNotFoundException

class OrderProcessorRepositoryImpl(OrderProcessorRepository):



    # Create a product in the database
    def create_product(self, product):
        cursor = self.connection.cursor()
        cursor.execute(
            "INSERT INTO products (product_name, price, stock_quantity) VALUES (?, ?, ?)",
            (product.product_name, product.price, product.stock_quantity)
        )
        self.connection.commit()

    # Create a customer in the database
    def create_customer(self, customer):
        cursor = self.connection.cursor()
        cursor.execute(
            "INSERT INTO customers (name, email, phone) VALUES (?, ?, ?)",
            (customer.name, customer.email, customer.phone)
        )
        self.connection.commit()

    # Delete a product by ID
    def delete_product(self, product_id):
        cursor = self.connection.cursor()
        cursor.execute("DELETE FROM products WHERE product_id = ?", (product_id,))
        self.connection.commit()

    # Delete a customer by ID
    def delete_customer(self, customer_id):
        cursor = self.connection.cursor()
        cursor.execute("DELETE FROM customers WHERE customer_id = ?", (customer_id,))
        self.connection.commit()

    # Add a product to the customer's cart
    def add_to_cart(self, customer, product, quantity):
        cursor = self.connection.cursor()
        cursor.execute(
            "INSERT INTO cart (customer_id, product_id, quantity) VALUES (?, ?, ?)",
            (customer.customer_id, product.product_id, quantity)
        )
        self.connection.commit()

    # Remove a product from the customer's cart
    def remove_from_cart(self, customer, product):
        cursor = self.connection.cursor()
        cursor.execute(
            "DELETE FROM cart WHERE customer_id = ? AND product_id = ?",
            (customer.customer_id, product.product_id)
        )
        self.connection.commit()

    # Get all products in the customer's cart
    def get_all_from_cart(self, customer):
        cursor = self.connection.cursor()
        cursor.execute(
            "SELECT p.product_id, p.product_name, p.price, c.quantity FROM cart c "
            "JOIN products p ON c.product_id = p.product_id WHERE c.customer_id = ?",
            (customer.customer_id,)
        )
        rows = cursor.fetchall()
        cart_items = [
            {'product_id': row[0], 'product_name': row[1], 'price': row[2], 'quantity': row[3]}
            for row in rows
        ]
        return cart_items

    # Place an order by inserting into the orders and order_items tables
    def place_order(self, customer, product_quantity_list, shipping_address):
        cursor = self.connection.cursor()
        # Insert into orders table
        cursor.execute(
            "INSERT INTO orders (customer_id, order_date, shipping_address) VALUES (?, GETDATE(), ?)",
            (customer.customer_id, shipping_address)
        )
        self.connection.commit()

        # Get the last inserted order_id
        order_id = cursor.lastrowid

        # Insert into order_items table
        for product, quantity in product_quantity_list:
            cursor.execute(
                "INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)",
                (order_id, product.product_id, quantity)
            )
        self.connection.commit()

    # Get all orders placed by a customer
    def get_orders_by_customer(self, customer_id):
        cursor = self.connection.cursor()
        cursor.execute(
            "SELECT o.order_id, o.order_date, oi.product_id, oi.quantity, p.product_name "
            "FROM orders o "
            "JOIN order_items oi ON o.order_id = oi.order_id "
            "JOIN products p ON oi.product_id = p.product_id "
            "WHERE o.customer_id = ?",
            (customer_id,)
        )
        rows = cursor.fetchall()
        orders = []
        for row in rows:
            orders.append({
                'order_id': row[0],
                'order_date': row[1],
                'product_id': row[2],
                'quantity': row[3],
                'product_name': row[4]
            })
        return orders
    
    

