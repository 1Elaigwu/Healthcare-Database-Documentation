-- Insert sample data into the Patients table
INSERT INTO Patients (FirstName, LastName, DOB, Gender, Address, Phone, Email, InsuranceID, EmergencyContactName, EmergencyContactPhone, Allergies, MedicalHistory, Height, Weight, BloodType)
VALUES ('John', 'Doe', '1990-05-15', 'Male', '123 Main St, Anytown, USA', '123-456-7890', 'john.doe@example.com', 1, 'Jane Doe', '987-654-3210', 'None', 'None', 180.5, 75.3, 'O'),
       ('Jane', 'Smith', '1985-08-20', 'Female', '456 Elm St, Othertown, USA', '987-654-3210', 'jane.smith@example.com', 2, 'John Smith', '123-456-7890', 'Peanuts', 'None', 165.8, 60.1, 'A');

-- Insert sample data into the Doctors table
INSERT INTO Doctors (FirstName, LastName, Specialty, Phone, Email, Department, LicenseNumber, YearsOfExperience, Education)
VALUES ('Dr. Sarah', 'Johnson', 'Cardiology', '555-123-4567', 'sarah.johnson@example.com', 'Cardiology Department', '123456', 15, 'MD, Cardiology'),
       ('Dr. Michael', 'Williams', 'Pediatrics', '555-987-6543', 'michael.williams@example.com', 'Pediatrics Department', '789012', 12, 'MD, Pediatrics');

-- Insert sample data into the Appointments table
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDateTime, Status, Notes, DurationMinutes, Procedure)
VALUES (1, 1, '2024-05-10 09:00:00', 'Scheduled', 'Regular checkup', 30, 'Physical examination'),
       (2, 2, '2024-05-12 10:00:00', 'Scheduled', 'Vaccination', 45, 'Immunization');

-- Insert sample data into the MedicalRecords table
INSERT INTO MedicalRecords (PatientID, DoctorID, DateOfVisit, Diagnosis, Treatment, LabResults, Medications, VitalSigns, FollowUpAppointment, ReferralDoctorID)
VALUES (1, 1, '2024-05-10', 'Normal', 'None', 'Normal', 'None', 'Normal', '2024-11-10', NULL),
       (2, 2, '2024-05-12', 'Normal', 'Vaccination', 'Normal', 'Vaccine X', 'Normal', NULL, NULL);

-- Insert sample data into the MedicalFacilities table
INSERT INTO MedicalFacilities (FacilityName, Location, ContactInfo, AvailableServices, Capacity, EmergencyServices, Accreditation)
VALUES ('General Hospital', '789 Oak St, Anytown, USA', '555-555-5555', 'General Medicine, Surgery, Pediatrics', 500, true, 'Joint Commission Accredited'),
       ('Childrens Clinic', '456 Maple St, Othertown, USA', '555-123-4567', 'Pediatrics, Immunization', 100, false, 'State Health Department Accredited');

-- Insert sample data into the InsuranceProviders table
INSERT INTO InsuranceProviders (InsuranceName, PolicyDetails, ContactInfo, CoverageArea, Website)
VALUES ('ABC Insurance', 'Details for ABC Insurance', '123-456-7890', 'Local', 'www.abcinsurance.com'),
       ('XYZ Insurance', 'Details for XYZ Insurance', '987-654-3210', 'National', 'www.xyzinsurance.com');

-- Insert sample data into the Departments table
INSERT INTO Departments (DepartmentName)
VALUES ('Cardiology Department'),
       ('Pediatrics Department');

-- Insert sample data into the Staff table
INSERT INTO Staff (FirstName, LastName, DepartmentID, Position, Phone, Email)
VALUES ('Nurse', 'Johnson', 1, 'Registered Nurse', '555-111-2222', 'nurse.johnson@example.com'),
       ('Nurse', 'Williams', 2, 'Registered Nurse', '555-333-4444', 'nurse.williams@example.com');

-- Insert sample data into the Treatments table
INSERT INTO Treatments (TreatmentName, Description, Cost)
VALUES ('Physical Examination', 'Routine physical examination', 100.00),
       ('Vaccination', 'Immunization against common diseases', 50.00);

-- Insert sample data into the MedicalEquipment table
INSERT INTO MedicalEquipment (EquipmentName, Description, Quantity, FacilityID)
VALUES ('Stethoscope', 'Used for auscultation', 10, 1),
       ('Syringe', 'Used for administering injections', 50, 2);

-- Insert sample data into the Prescriptions table
INSERT INTO Prescriptions (RecordID, MedicationName, Dosage, Frequency)
VALUES (7, 'Medication Y', '10 mg', 'Once daily'),
       (8, 'Vaccine X', '2 mL', 'Single dose');

-- Insert sample data into the LabTests table
INSERT INTO LabTests (TestName, Description, Cost)
VALUES ('Blood Test', 'General blood test', 75.00),
       ('Urine Test', 'Urine analysis', 50.00);

-- Insert sample data into the TestResults table
INSERT INTO TestResults (TestID, RecordID, Result)
VALUES (1, 7, 'Normal'),
       (2, 8, 'Normal');

-- Insert sample data into the Billing table
INSERT INTO Billing (RecordID, Amount, BillingDateTime)
VALUES (7, 150.00, '2024-05-11 11:30:00'),
       (8, 75.00, '2024-05-13 12:45:00');

-- Insert sample data into the Reviews table
INSERT INTO Reviews (PatientID, DoctorID, Rating, ReviewText, ReviewDateTime)
VALUES (1, 1, 5, 'Great experience, very professional', '2024-05-10 12:00:00'),
       (2, 2, 4, 'Good service, but had to wait a bit long', '2024-05-12 13:30:00');
