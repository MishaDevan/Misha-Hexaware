import sys
import os


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from abc import ABC, abstractmethod
from entity.product import Product


class ProductDAO(ABC):
    
    def create_product(self, product: Product) -> bool:
        pass

    
    def delete_product(self, product_id: int) -> bool:
        pass

    
    def get_all_products(self) -> list:
        pass


class ProductDAOImpl(ProductDAO):
    def create_product(self, product: Product) -> bool:
        # TODO: Implement actual DB logic
        print(f"Inserting product {product.name}")
        return True

    def delete_product(self, product_id: int) -> bool:
        print(f"Deleting product with ID {product_id}")
        return True

    def get_all_products(self) -> list:
        print("Returning list of all products")
        return []
