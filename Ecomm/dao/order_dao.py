import sys
import os


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from abc import ABC, abstractmethod
from entity.customer import Customer  

class OrderDAO(ABC):
    @abstractmethod
    def place_order(self, customer: Customer, product_quantity_list: list, shipping_address: str) -> bool:
        pass

    @abstractmethod
    def get_orders_by_customer(self, customer_id: int) -> list:
        pass

class OrderDAOImpl(OrderDAO):
    def place_order(self, customer: Customer, product_quantity_list: list, shipping_address: str) -> bool:
        return True

    def get_orders_by_customer(self, customer_id: int) -> list:
        return []
