import unittest
import sys
import os


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from entity.product import Product
from entity.customer import Customer
from dao.product_dao import ProductDAOImpl
from dao.cart_dao import CartDAOImpl

class TestExceptions(unittest.TestCase):

    def test_invalid_customer_id(self):
        customer_dao = CartDAOImpl()
        product = Product(product_id=1, name="Laptop", price=50000)
        customer = Customer(customer_id=999, name="Non Existent", email="nonexistent@example.com", password="password123")
        with self.assertRaises(ValueError):  # Assuming your implementation raises ValueError for invalid customer
            customer_dao.add_to_cart(customer, product, 1)

    def test_invalid_product_id(self):
        customer = Customer(customer_id=1, name="John Doe", email="john@example.com", password="password123")
        product_dao = ProductDAOImpl()
        product = Product(product_id=999, name="Non Existent Product", price=0)
        with self.assertRaises(ValueError):  # Assuming your implementation raises ValueError for invalid product
            product_dao.add_to_cart(customer, product, 1)

if __name__ == '__main__':
    unittest.main()
