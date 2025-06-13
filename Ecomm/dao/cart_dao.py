import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from abc import ABC, abstractmethod
from entity.cart import Cart
from entity.customer import Customer
from entity.product import Product


class CartDAO(ABC):
    
    def add_to_cart(self, customer: Customer, product: Product, quantity: int) -> bool:
        pass

    
    def remove_from_cart(self, customer: Customer, product: Product) -> bool:
        pass

    
    def get_all_from_cart(self, customer: Customer) -> list[Cart]:
        pass


class CartDAOImpl(CartDAO):

    def __init__(self):
        self.cart_storage = {}

    def add_to_cart(self, customer: Customer, product: Product, quantity: int) -> bool:
        customer_id = customer.id
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

    def remove_from_cart(self, customer: Customer, product: Product) -> bool:
        customer_id = customer.id
        if customer_id in self.cart_storage:
            self.cart_storage[customer_id] = [
                item for item in self.cart_storage[customer_id] if item.product.id != product.id
            ]
            return True
        return False

    def get_all_from_cart(self, customer: Customer) -> list[Cart]:
        return self.cart_storage.get(customer.id, [])

