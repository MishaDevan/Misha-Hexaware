import sys
import os
import unittest

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from entity.product import Product
from entity.customer import Customer
from dao.cart_dao import CartDAOImpl
from dao.product_dao import ProductDAOImpl
from entity.cart import Cart
from dao.cart_dao import CartDAO  # Import CartDAO


class TestAddToCart(unittest.TestCase):
    def test_add_to_cart(self):
        pass  # Placeholder for the test implementation

class CartDAOImpl(CartDAO):
    def add_to_cart(self, customer: Customer, product: Product, quantity: int) -> bool:
        customer_id = customer.customer_id  # Make sure you use customer.customer_id, not customer.id
        if customer_id not in self.cart_storage:
            self.cart_storage[customer_id] = []

        # Check if the product is already in the cart
        for item in self.cart_storage[customer_id]:
            if item.product.id == product.id:
                item.quantity += quantity
                return True

        # Add new product to the cart
        self.cart_storage[customer_id].append(Cart(customer, product, quantity))
        return True

if __name__ == '__main__':
    unittest.main()
