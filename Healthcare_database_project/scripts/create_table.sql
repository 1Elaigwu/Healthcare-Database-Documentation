CREATE DATABASE healthcare_database;

-- Table 1: Patients
CREATE TABLE Patients (
    PatientID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    InsuranceID INT,
    EmergencyContactName VARCHAR(100),
    EmergencyContactPhone VARCHAR(20),
    Allergies TEXT,
    MedicalHistory TEXT,
    Height DECIMAL(5, 2),
    Weight DECIMAL(5, 2),
    BloodType VARCHAR(5)
);

-- Table 2: Doctors
CREATE TABLE Doctors (
    DoctorID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Department VARCHAR(100),
    LicenseNumber VARCHAR(50),
    YearsOfExperience INT,
    Education VARCHAR(255)
);

-- Table 3: Appointments
CREATE TABLE Appointments (
    AppointmentID SERIAL PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDateTime TIMESTAMP,
    Status VARCHAR(20),
    Notes TEXT,
    DurationMinutes INT,
    Procedure VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Table 4: Medical Records
CREATE TABLE MedicalRecords (
    RecordID SERIAL PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    DateOfVisit DATE,
    Diagnosis TEXT,
    Treatment TEXT,
    LabResults TEXT,
    Medications TEXT,
    VitalSigns TEXT,
    FollowUpAppointment TIMESTAMP,
    ReferralDoctorID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (ReferralDoctorID) REFERENCES Doctors(DoctorID)
);

-- Table 5: Medical Facilities
CREATE TABLE MedicalFacilities (
    FacilityID SERIAL PRIMARY KEY,
    FacilityName VARCHAR(100),
    Location VARCHAR(255),
    ContactInfo VARCHAR(255),
    AvailableServices TEXT,
    Capacity INT,
    EmergencyServices BOOLEAN,
    Accreditation VARCHAR(100)
);

-- Table 6: Insurance Providers
CREATE TABLE InsuranceProviders (
    InsuranceID SERIAL PRIMARY KEY,
    InsuranceName VARCHAR(100),
    PolicyDetails TEXT,
    ContactInfo VARCHAR(255),
    CoverageArea VARCHAR(255),
    Website VARCHAR(255)
);

-- Table 7: Departments
CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Table 8: Staff
CREATE TABLE Staff (
    StaffID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Position VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table 9: Treatments
CREATE TABLE Treatments (
    TreatmentID SERIAL PRIMARY KEY,
    TreatmentName VARCHAR(100),
    Description TEXT,
    Cost DECIMAL(10, 2)
);

-- Table 10: Medical Equipment
CREATE TABLE MedicalEquipment (
    EquipmentID SERIAL PRIMARY KEY,
    EquipmentName VARCHAR(100),
    Description TEXT,
    Quantity INT,
    FacilityID INT,
    FOREIGN KEY (FacilityID) REFERENCES MedicalFacilities(FacilityID)
);

-- Table 11: Prescriptions
CREATE TABLE Prescriptions (
    PrescriptionID SERIAL PRIMARY KEY,
    RecordID INT,
    MedicationName VARCHAR(100),
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID)
);

-- Table 12: Lab Tests
CREATE TABLE LabTests (
    TestID SERIAL PRIMARY KEY,
    TestName VARCHAR(100),
    Description TEXT,
    Cost DECIMAL(10, 2)
);

-- Table 13: Test Results
CREATE TABLE TestResults (
    ResultID SERIAL PRIMARY KEY,
    TestID INT,
    RecordID INT,
    Result TEXT,
    FOREIGN KEY (TestID) REFERENCES LabTests(TestID),
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID)
);

-- Table 14: Billing
CREATE TABLE Billing (
    BillingID SERIAL PRIMARY KEY,
    RecordID INT,
    Amount DECIMAL(10, 2),
    BillingDateTime TIMESTAMP,
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID)
);

-- Table 15: Reviews
CREATE TABLE Reviews (
    ReviewID SERIAL PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Rating INT,
    ReviewText TEXT,
    ReviewDateTime TIMESTAMP,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
