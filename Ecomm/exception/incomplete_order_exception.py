class IncompleteOrderException(Exception):
    def __init__(self, message="Order could not be completed."):
        super().__init__(message)
