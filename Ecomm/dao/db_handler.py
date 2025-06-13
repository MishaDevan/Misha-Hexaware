import pyodbc

class DBHandler:
    def __init__(self):
        self.connection = None
        self.cursor = None

    def get_connection(self):
        
        if self.connection is None:
            try:
                
                conn_str = (
                    'DRIVER={SQL Server};'
                    'SERVER=MISHA\\MSSQLSERVER01;'
                    'DATABASE=Ecomm;'
                    'Trusted_Connection=yes;'
                )
                # Connect to the database
                self.connection = pyodbc.connect(conn_str)
                self.cursor = self.connection.cursor()
                print("Connection successful.")
            except Exception as e:
                print(f"Error connecting to the database: {e}")
                raise
        return self.connection

    def close_connection(self):
        
        if self.cursor:
            self.cursor.close()
        if self.connection:
            self.connection.close()
        print("Database connection closed.")
