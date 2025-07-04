class Customer:
    def __init__(self, customer_id=None, name=None, email=None, password=None):
        self.customer_id = customer_id
        self.name = name
        self.email = email
        self.password = password

    # Getters and Setters
    def get_customer_id(self):
        return self.customer_id

    def set_customer_id(self, customer_id):
        self.customer_id = customer_id

    def get_name(self):
        return self.name

    def set_name(self, name):
        self.name = name

    def get_email(self):
        return self.email

    def set_email(self, email):
        self.email = email

    def get_password(self):
        return self.password

    def set_password(self, password):
        self.password = password


    def __str__(self):
        return f"{self.__product_id} - {self.__name} - ${self.__price} - Qty: {self.__stock_quantity}"