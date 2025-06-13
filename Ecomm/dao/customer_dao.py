import sys
import os


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from abc import ABC, abstractmethod
from entity.customer import Customer  
class CustomerDAO(ABC):
    
    def create_customer(self, customer: Customer) -> bool:
        pass

    
    def delete_customer(self, customer_id: int) -> bool:
        pass


class CustomerDAOImpl(CustomerDAO):
    def create_customer(self, customer: Customer) -> bool:
        return True

    def delete_customer(self, customer_id: int) -> bool:
        return True
