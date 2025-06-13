import unittest
import sys
import os


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from entity.product import Product
from entity.customer import Customer
from dao.order_dao import OrderDAOImpl

class TestPlaceOrder(unittest.TestCase):

    def test_place_order(self):
        order_dao = OrderDAOImpl()
        customer = Customer(customer_id=1, name="John Doe", email="john@example.com", password="password123")
        product = Product(product_id=1, name="Laptop", price=50000)
        product_quantity_list = [(product, 1)]  # List of tuples (product, quantity)
        shipping_address = "123 Main Street"
        result = order_dao.place_order(customer, product_quantity_list, shipping_address)
        self.assertTrue(result)  # Expecting True if the order was placed successfully

if __name__ == '__main__':
    unittest.main()
