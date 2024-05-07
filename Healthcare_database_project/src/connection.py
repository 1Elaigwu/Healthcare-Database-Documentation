import sqlalchemy
from sqlalchemy import create_engine

# Define your PostgreSQL connection string
# Replace 'username', 'password', 'host', 'port', and 'database_name' with your actual PostgreSQL credentials
# Example connection string format: 'postgresql://username:password@host:port/database_name'
connection_string = 'postgresql://postgres:postgres@localhost:5432/healthcare_database'

# Establish a connection to the database
engine = create_engine(connection_string)

# Try to connect to the database
try:
    # Attempt to connect using the engine
    connection = engine.connect()
    print("Connection successful! Credentials are valid.")
    
    # Close the connection
    connection.close()
except Exception as e:
    # If an exception occurs, print an error message indicating the failure
    print("Connection failed. Credentials are not valid:", e)
