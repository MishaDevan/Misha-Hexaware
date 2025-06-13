import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from dao.product_dao import ProductDAOImpl  
from dao.cart_dao import CartDAOImpl  
from dao.order_dao import OrderDAOImpl  
from entity.product import Product
from exception.invalid_data_exception import InvalidDataException
from entity.customer import Customer

def main():
    product_dao = ProductDAOImpl()  
    cart_dao = CartDAOImpl()  
    order_dao = OrderDAOImpl()  

    while True:
        print("\n=== E-Commerce System ===")
        print("1. Add Product")
        print("2. Add Customer")
        print("3. Delete Product")
        print("4. Delete Customer")
        print("5. Add to Cart")
        print("6. View Cart")
        print("7. Place Order")
        print("8. View Orders")
        print("9. Exit")

        choice = input("Enter your choice: ")

        try:
            if choice == '1':
                name = input("Product Name: ")
                price = float(input("Price: "))
                desc = input("Description: ")
                stock = int(input("Stock: "))
                product = Product(name, price, desc, stock)
                print("Added!" if product_dao.create_product(product) else "Failed.")

            elif choice == '2':
                name = input("Customer Name: ")
                email = input("Email: ")
                pwd = input("Password: ")
                customer = Customer(name, email, pwd)
                print("Added!" if product_dao.create_customer(customer) else "Failed.")

            elif choice == '3':
                pid = int(input("Enter Product ID to delete: "))
                print("Deleted!" if product_dao.delete_product(pid) else "Not Found.")

            elif choice == '4':
                cid = int(input("Enter Customer ID to delete: "))
                print("Deleted!" if product_dao.delete_customer(cid) else "Not Found.")

            elif choice == '5':
                cid = int(input("Customer ID: "))
                pid = int(input("Product ID: "))
                qty = int(input("Quantity: "))
                customer = Customer(customer_id=cid)
                product = Product(product_id=pid)
                print("Added to cart!" if cart_dao.add_to_cart(customer, product, qty) else "Failed.")

            elif choice == '6':
                cid = int(input("Customer ID: "))
                customer = Customer(customer_id=cid)
                cart_items = cart_dao.get_all_from_cart(customer)
                print("Your Cart:")
                for item in cart_items:
                    print(item)

            elif choice == '7':
                cid = int(input("Customer ID: "))
                address = input("Shipping Address: ")
                customer = Customer(customer_id=cid)
                print("Placing order...")
                print("Order placed!" if order_dao.place_order(customer, address) else "Failed.")

            elif choice == '8':
                cid = int(input("Customer ID: "))
                orders = order_dao.get_orders_by_customer(cid)
                for o in orders:
                    print(o)

            elif choice == '9':
                print("Exiting...")
                break

            else:
                print("Invalid choice.")

        except InvalidDataException as e:
            print("Invalid data:", e)
        except Exception as e:
            print("Error:", e)

if __name__ == "__main__":
    main()
