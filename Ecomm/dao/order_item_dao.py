import sys
import os


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from abc import ABC, abstractmethod
from entity.order_item import OrderItem  
class OrderItemDAO(ABC):
    @abstractmethod
    def add_order_item(self, order_item: OrderItem) -> bool:
        pass

    @abstractmethod
    def remove_order_item(self, order_item_id: int) -> bool:
        pass


class OrderItemDAOImpl(OrderItemDAO):
    def add_order_item(self, order_item: OrderItem) -> bool:
        return True

    def remove_order_item(self, order_item_id: int) -> bool:
        return True
