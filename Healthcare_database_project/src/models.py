from sqlalchemy import Column, Integer, String, Date, Text, Boolean, DECIMAL, TIMESTAMP, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

class Patient(Base):
    __tablename__ = 'patients'
    
    PatientID = Column(Integer, primary_key=True)
    FirstName = Column(String(50))
    LastName = Column(String(50))
    DOB = Column(Date)
    Gender = Column(String(10))
    Address = Column(String(255))
    Phone = Column(String(20))
    Email = Column(String(100))
    InsuranceID = Column(Integer)
    EmergencyContactName = Column(String(100))
    EmergencyContactPhone = Column(String(20))
    Allergies = Column(Text)
    MedicalHistory = Column(Text)
    Height = Column(DECIMAL(5, 2))
    Weight = Column(DECIMAL(5, 2))
    BloodType = Column(String(5))

class Doctor(Base):
    __tablename__ = 'doctors'
    
    DoctorID = Column(Integer, primary_key=True)
    FirstName = Column(String(50))
    LastName = Column(String(50))
    Specialty = Column(String(100))
    Phone = Column(String(20))
    Email = Column(String(100))
    Department = Column(String(100))
    LicenseNumber = Column(String(50))
    YearsOfExperience = Column(Integer)
    Education = Column(String(255))

class Appointment(Base):
    __tablename__ = 'appointments'
    
    AppointmentID = Column(Integer, primary_key=True)
    PatientID = Column(Integer, ForeignKey('patients.PatientID'))
    DoctorID = Column(Integer, ForeignKey('doctors.DoctorID'))
    AppointmentDateTime = Column(TIMESTAMP)
    Status = Column(String(20))
    Notes = Column(Text)
    DurationMinutes = Column(Integer)
    Procedure = Column(String(255))
    patient = relationship("Patient")
    doctor = relationship("Doctor")

class MedicalRecord(Base):
    __tablename__ = 'medical_records'
    
    RecordID = Column(Integer, primary_key=True)
    PatientID = Column(Integer, ForeignKey('patients.PatientID'))
    DoctorID = Column(Integer, ForeignKey('doctors.DoctorID'))
    DateOfVisit = Column(Date)
    Diagnosis = Column(Text)
    Treatment = Column(Text)
    LabResults = Column(Text)
    Medications = Column(Text)
    VitalSigns = Column(Text)
    FollowUpAppointment = Column(TIMESTAMP)
    ReferralDoctorID = Column(Integer, ForeignKey('doctors.DoctorID'))
    patient = relationship("Patient")
    doctor = relationship("Doctor", foreign_keys=[DoctorID])
    referral_doctor = relationship("Doctor", foreign_keys=[ReferralDoctorID])

class MedicalFacility(Base):
    __tablename__ = 'medical_facilities'
    
    FacilityID = Column(Integer, primary_key=True)
    FacilityName = Column(String(100))
    Location = Column(String(255))
    ContactInfo = Column(String(255))
    AvailableServices = Column(Text)
    Capacity = Column(Integer)
    EmergencyServices = Column(Boolean)
    Accreditation = Column(String(100))

class InsuranceProvider(Base):
    __tablename__ = 'insurance_providers'
    
    InsuranceID = Column(Integer, primary_key=True)
    InsuranceName = Column(String(100))
    PolicyDetails = Column(Text)
    ContactInfo = Column(String(255))
    CoverageArea = Column(String(255))
    Website = Column(String(255))

class Department(Base):
    __tablename__ = 'departments'
    
    DepartmentID = Column(Integer, primary_key=True)
    DepartmentName = Column(String(100))

class Staff(Base):
    __tablename__ = 'staff'
    
    StaffID = Column(Integer, primary_key=True)
    FirstName = Column(String(50))
    LastName = Column(String(50))
    DepartmentID = Column(Integer, ForeignKey('departments.DepartmentID'))
    Position = Column(String(100))
    Phone = Column(String(20))
    Email = Column(String(100))
    department = relationship("Department")

class Treatment(Base):
    __tablename__ = 'treatments'
    
    TreatmentID = Column(Integer, primary_key=True)
    TreatmentName = Column(String(100))
    Description = Column(Text)
    Cost = Column(DECIMAL(10, 2))

class MedicalEquipment(Base):
    __tablename__ = 'medical_equipment'
    
    EquipmentID = Column(Integer, primary_key=True)
    EquipmentName = Column(String(100))
    Description = Column(Text)
    Quantity = Column(Integer)
    FacilityID = Column(Integer, ForeignKey('medical_facilities.FacilityID'))
    facility = relationship("MedicalFacility")

class Prescription(Base):
    __tablename__ = 'prescriptions'
    
    PrescriptionID = Column(Integer, primary_key=True)
    RecordID = Column(Integer, ForeignKey('medical_records.RecordID'))
    MedicationName = Column(String(100))
    Dosage = Column(String(50))
    Frequency = Column(String(50))
    medical_record = relationship("MedicalRecord")

class LabTest(Base):
    __tablename__ = 'lab_tests'
    
    TestID = Column(Integer, primary_key=True)
    TestName = Column(String(100))
    Description = Column(Text)
    Cost = Column(DECIMAL(10, 2))

class TestResult(Base):
    __tablename__ = 'test_results'
    
    ResultID = Column(Integer, primary_key=True)
    TestID = Column(Integer, ForeignKey('lab_tests.TestID'))
    RecordID = Column(Integer, ForeignKey('medical_records.RecordID'))
    Result = Column(Text)
    lab_test = relationship("LabTest")
    medical_record = relationship("MedicalRecord")

class Billing(Base):
    __tablename__ = 'billing'
    
    BillingID = Column(Integer, primary_key=True)
    RecordID = Column(Integer, ForeignKey('medical_records.RecordID'))
    Amount = Column(DECIMAL(10, 2))
    BillingDateTime = Column(TIMESTAMP)
    medical_record = relationship("MedicalRecord")

class Review(Base):
    __tablename__ = 'reviews'
    
    ReviewID = Column(Integer, primary_key=True)
    PatientID = Column(Integer, ForeignKey('patients.PatientID'))
    DoctorID = Column(Integer, ForeignKey('doctors.DoctorID'))
    Rating = Column(Integer)
    ReviewText = Column(Text)
    ReviewDateTime = Column(TIMESTAMP)
    patient = relationship("Patient")
    doctor = relationship("Doctor")
