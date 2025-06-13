import sys
import os


sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import unittest
from entity.product import Product
from dao.product_dao import ProductDAOImpl

class TestProductCreation(unittest.TestCase):
    def test_product_creation(self):
        product_dao = ProductDAOImpl()
        product = Product(product_id=1, name="Laptop", price=50000)
        result = product_dao.create_product(product)
        self.assertTrue(result) 

if __name__ == '__main__':
    unittest.main()