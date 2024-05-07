import psycopg2
from psycopg2 import sql

# Database connection parameters
DB_NAME = "healthcare_database"
DB_USER = "postgres"
DB_PASSWORD = "postgres"
DB_HOST = "localhost"
DB_PORT = "5432"

# Establish database connection
def connect():
    try:
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        print("Connected to the database")
        return conn
    except psycopg2.Error as e:
        print("Unable to connect to the database:", e)
        return None

# Execute stored procedure to get patient info
def get_patient_info(conn, patient_id):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM GetPatientInfo(%s)", (patient_id,))
        result = cursor.fetchone()
        cursor.close()
        return result
    except psycopg2.Error as e:
        print("Error retrieving patient info:", e)
        return None

# Execute stored procedure to add appointment
def add_appointment(conn, patient_id, doctor_id, appointment_datetime):
    try:
        cursor = conn.cursor()
        cursor.execute("CALL AddAppointment(%s, %s, %s)", (patient_id, doctor_id, appointment_datetime))
        conn.commit()
        cursor.close()
        print("Appointment added successfully")
    except psycopg2.Error as e:
        print("Error adding appointment:", e)

def main():
    # Connect to the database
    conn = connect()

    if conn:
        # Example usage: Get patient info
        patient_id = 1  # Change this to the desired patient ID
        patient_info = get_patient_info(conn, patient_id)
        if patient_info:
            print("Patient Info:")
            print(patient_info)

        # Example usage: Add appointment
        patient_id = 1  # Change this to the desired patient ID
        doctor_id = 1   # Change this to the desired doctor ID
        appointment_datetime = "2024-05-15 10:00:00"  # Change this to the desired appointment date and time
        add_appointment(conn, patient_id, doctor_id, appointment_datetime)

        # Close database connection
        conn.close()
        print("Disconnected from the database")

if __name__ == "__main__":
    main()