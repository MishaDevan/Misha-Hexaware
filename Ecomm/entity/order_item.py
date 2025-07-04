class OrderItem:
    def __init__(self, order_item_id=None, order_id=None, product_id=None, quantity=None):
        self.order_item_id = order_item_id
        self.order_id = order_id
        self.product_id = product_id
        self.quantity = quantity

    # Getters and Setters
    def get_order_item_id(self):
        return self.order_item_id

    def set_order_item_id(self, order_item_id):
        self.order_item_id = order_item_id

    def get_order_id(self):
        return self.order_id

    def set_order_id(self, order_id):
        self.order_id = order_id

    def get_product_id(self):
        return self.product_id

    def set_product_id(self, product_id):
        self.product_id = product_id

    def get_quantity(self):
        return self.quantity

    def set_quantity(self, quantity):
        self.quantity = quantity
