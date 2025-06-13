import sys
import os


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from abc import ABC, abstractmethod

class OrderProcessorRepository(ABC):

    
    def create_product(self, product): pass

    
    def create_customer(self, customer): pass

    
    def delete_product(self, product_id): pass

    
    def delete_customer(self, customer_id): pass

    
    def add_to_cart(self, customer, product, quantity): pass

    
    def remove_from_cart(self, customer, product): pass

    
    def get_all_from_cart(self, customer): pass

    
    def place_order(self, customer, product_quantity_list, shipping_address): pass

    
    def get_orders_by_customer(self, customer_id): pass
