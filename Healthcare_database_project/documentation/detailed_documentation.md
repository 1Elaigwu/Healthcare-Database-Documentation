# Detailed Documentation for Healthcare Database

## Tables

### Table 1: Patients

#### Purpose
The Patients table stores information about patients, including personal details and medical history.

#### Fields
- `PatientID` (Primary Key): Unique identifier for each patient.
- `FirstName`: First name of the patient.
- `LastName`: Last name of the patient.
- `DOB`: Date of birth of the patient.
- `Gender`: Gender of the patient.
- `Address`: Address of the patient.
- `Phone`: Phone number of the patient.
- `Email`: Email address of the patient.
- `InsuranceID`: Foreign key referencing the InsuranceProviders table, representing the patient's insurance provider.
- `EmergencyContactName`: Name of the patient's emergency contact.
- `EmergencyContactPhone`: Phone number of the patient's emergency contact.
- `Allergies`: Any allergies the patient may have.
- `MedicalHistory`: Medical history of the patient.
- `Height`: Height of the patient.
- `Weight`: Weight of the patient.
- `BloodType`: Blood type of the patient.

#### Relationships
- PatientID has relationships with MedicalRecords, Appointments, Reviews, Prescriptions, and Billing tables.

### Table 2: Doctors

#### Purpose
The Doctors table stores information about medical professionals, including their specialties and contact details.

#### Fields
- `DoctorID` (Primary Key): Unique identifier for each doctor.
- `FirstName`: First name of the doctor.
- `LastName`: Last name of the doctor.
- `Specialty`: Medical specialty of the doctor.
- `Phone`: Phone number of the doctor.
- `Email`: Email address of the doctor.
- `Department`: Department within the healthcare organization where the doctor works.
- `LicenseNumber`: License number of the doctor.
- `YearsOfExperience`: Years of experience of the doctor.
- `Education`: Educational qualifications of the doctor.

#### Relationships
- DoctorID has relationships with Appointments, MedicalRecords, and Reviews tables.

### Table 3: Appointments

#### Purpose
The Appointments table tracks scheduled appointments between patients and doctors.

#### Fields
- `AppointmentID` (Primary Key): Unique identifier for each appointment.
- `PatientID`: Foreign key referencing the Patients table, representing the patient associated with the appointment.
- `DoctorID`: Foreign key referencing the Doctors table, representing the doctor conducting the appointment.
- `AppointmentDateTime`: Date and time of the appointment.
- `Status`: Status of the appointment (e.g., scheduled, canceled, completed).
- `Notes`: Additional notes related to the appointment.
- `DurationMinutes`: Duration of the appointment in minutes.
- `Procedure`: Procedure or reason for the appointment.

#### Relationships
- PatientID and DoctorID reference Patients and Doctors tables, respectively.

### Table 4: Medical Records

#### Purpose
The MedicalRecords table stores comprehensive medical records for patients, including diagnoses, treatments, and test results.

#### Fields
- `RecordID` (Primary Key): Unique identifier for each medical record.
- `PatientID`: Foreign key referencing the Patients table, representing the patient associated with the medical record.
- `DoctorID`: Foreign key referencing the Doctors table, representing the doctor responsible for the medical record.
- `DateOfVisit`: Date of the medical visit.
- `Diagnosis`: Diagnosis provided by the doctor.
- `Treatment`: Treatment plan prescribed by the doctor.
- `LabResults`: Laboratory test results.
- `Medications`: Medications prescribed to the patient.
- `VitalSigns`: Vital signs recorded during the visit.
- `FollowUpAppointment`: Date and time of the follow-up appointment.
- `ReferralDoctorID`: Foreign key referencing the Doctors table, representing the referral doctor for the patient.

#### Relationships
- PatientID and DoctorID reference Patients and Doctors tables, respectively. ReferralDoctorID also references the Doctors table.

### Table 5: Medical Facilities

#### Purpose
The MedicalFacilities table stores information about medical facilities, including their location and available services.

#### Fields
- `FacilityID` (Primary Key): Unique identifier for each medical facility.
- `FacilityName`: Name of the medical facility.
- `Location`: Location of the facility.
- `ContactInfo`: Contact information for the facility.
- `AvailableServices`: List of medical services offered at the facility.
- `Capacity`: Capacity of the facility.
- `EmergencyServices`: Indicates whether the facility provides emergency services.
- `Accreditation`: Accreditation status of the facility.

#### Relationships
- None

### Table 6: Insurance Providers

#### Purpose
The InsuranceProviders table stores information about insurance providers and their policies.

#### Fields:
- `InsuranceID` (Primary Key): Unique identifier for each insurance provider.
- `InsuranceName`: Name of the insurance provider.
- `PolicyDetails`: Details of insurance policies offered by the provider.
- `ContactInfo`: Contact information for the insurance provider.
- `CoverageArea`: Coverage area of the insurance provider.
- `Website`: Website of the insurance provider.

#### Relationships
- None

### Table 7: Departments

#### Purpose
The Departments table stores information about departments within the healthcare organization.

#### Fields
- `DepartmentID` (Primary Key): Unique identifier for each department.
- `DepartmentName`: Name of the department.

#### Relationships
- None

### Table 8: Staff

#### Purpose
The Staff table stores information about staff members working in various departments.

#### Fields
- `StaffID` (Primary Key): Unique identifier for each staff member.
- `FirstName`: First name of the staff member.
- `LastName`: Last name of the staff member.
- `DepartmentID`: Foreign key referencing the Departments table, representing the department where the staff member works.
- `Position`: Position or role of the staff member.
- `Phone`: Phone number of the staff member.
- `Email`: Email address of the staff member.

#### Relationships
- DepartmentID references the Departments table.

### Table 9: Treatments

#### Purpose
The Treatments table stores information about medical treatments offered by the healthcare organization.

#### Fields
- `TreatmentID` (Primary Key): Unique identifier for each treatment.
- `TreatmentName`: Name of the treatment.
- `Description`: Description of the treatment.
- `Cost`: Cost of the treatment.

#### Relationships
- None

### Table 10: Medical Equipment

#### Purpose
The MedicalEquipment table stores information about medical equipment available at medical facilities.

#### Fields
- `EquipmentID` (Primary Key): Unique identifier for each piece of equipment.
- `EquipmentName`: Name of the medical equipment.
- `Description`: Description of the medical equipment.
- `Quantity`: Quantity of the medical equipment available.
- `FacilityID`: Foreign key referencing the MedicalFacilities table, representing the facility where the equipment is located.

#### Relationships
- FacilityID references the MedicalFacilities table.

### Table 11: Prescriptions

#### Purpose
The Prescriptions table stores information about prescriptions issued to patients.

#### Fields
- `PrescriptionID` (Primary Key): Unique identifier for each prescription.
- `RecordID`: Foreign key referencing the MedicalRecords table, representing the medical record associated with the prescription.
- `MedicationName`: Name of the medication prescribed.
- `Dosage`: Dosage instructions for the medication.
- `Frequency`: Frequency of administration for the medication.

#### Relationships
- RecordID references the MedicalRecords table.

### Table 12: Lab Tests

#### Purpose
The LabTests table stores information about laboratory tests offered by the healthcare organization.

#### Fields
- `TestID` (Primary Key): Unique identifier for each laboratory test.
- `TestName`: Name of the laboratory test.
- `Description`: Description of the laboratory test.
- `Cost`: Cost of the laboratory test.

#### Relationships
- None

### Table 13: Test Results

#### Purpose
The TestResults table stores results of laboratory tests conducted for patients.

#### Fields
- `ResultID` (Primary Key): Unique identifier for each test result.
- `TestID`: Foreign key referencing the LabTests table, representing the laboratory test associated with the result.
- `RecordID`: Foreign key referencing the MedicalRecords table, representing the medical record associated with the result.
- `Result`: Result of the laboratory test.

#### Relationships
- TestID and RecordID reference the LabTests and MedicalRecords tables, respectively.

### Table 14: Billing

#### Purpose
The Billing table stores information about billing transactions related to medical services provided.

#### Fields
- `BillingID` (Primary Key): Unique identifier for each billing transaction.
- `RecordID`: Foreign key referencing the MedicalRecords table, representing the medical record associated with the billing.
- `Amount`: Amount charged for the medical services.
- `BillingDateTime`: Date and time of the billing transaction.

#### Relationships
- RecordID references the MedicalRecords table.

### Table 15: Reviews

#### Purpose
The Reviews table stores patient reviews and ratings for doctors.

#### Fields:
- `ReviewID` (Primary Key): Unique identifier for each review.
- `PatientID`: Foreign key referencing the Patients table, representing the patient who wrote the review.
- `DoctorID`: Foreign key referencing the Doctors table, representing the doctor who is being reviewed.
- `Rating`: Rating given by the patient (e.g., on a scale of 1 to 5).
- `ReviewText`: Text of the review.
- `ReviewDateTime`: Date and time when the review was submitted.

#### Relationships
- PatientID and DoctorID reference the Patients and Doctors tables, respectively.

## Stored Procedures

### Procedure 1: GetPatientInfo

#### Purpose
The `GetPatientInfo` stored procedure retrieves detailed information about a patient based on their `PatientID`.

#### Parameters
- `patient_id`: The ID of the patient for whom information is to be retrieved.

#### Returns
- `PatientID`: The ID of the patient.
- `FirstName`: First name of the patient.
- `LastName`: Last name of the patient.
- `DOB`: Date of birth of the patient.
- `Gender`: Gender of the patient.
- `Address`: Address of the patient.
- `Phone`: Phone number of the patient.
- `Email`: Email address of the patient.
- `InsuranceID`: ID of the insurance provider associated with the patient.
- `EmergencyContactName`: Name of the patient's emergency contact.
- `EmergencyContactPhone`: Phone number of the patient's emergency contact.
- `Allergies`: Any allergies the patient may have.
- `MedicalHistory`: Medical history of the patient.
- `Height`: Height of the patient.
- `Weight`: Weight of the patient.
- `BloodType`: Blood type of the patient.

### Procedure 2: AddAppointment

#### Purpose
The `AddAppointment` stored procedure adds a new appointment between a patient and a doctor.

#### Parameters
- `patient_id`: The ID of the patient for whom the appointment is being scheduled.
- `doctor_id`: The ID of the doctor conducting the appointment.
- `appointment_datetime`: Date and time of the appointment.

#### Returns
- None

