
class OrderNotFoundException(Exception):
    def __init__(self, order_id):
       
        self.message = f"Order with ID {order_id} not found."
        super().__init__(self.message)
