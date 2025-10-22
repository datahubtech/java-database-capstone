
## MySQL Database Design

**Tables:**

1. patients
2. doctors
3. appointments
4. admins
5. payments
6. doctor_availability
7. clinic_locations


**Table: patients**

|Column Name  |Data Type        |Constraints                |
|-------------|-----------------|---------------------------|
|id           |INT              |PRIMARY KEY, AUTO_INCREMENT|
|full_name    |VARCHAR(100)     |NOT NULL                   |
|email        |VARCHAR(150)     |NOT NULL, UNIQUE           |
|password_hash|VARCHAR(255)     |NOT NULL                   |
|phone_number |VARCHAR(20)      |                           |
|date_of_birth|DATE             |                           |
|gender       |ENUM('M','F','O')|                           |
|created_at   |TIMESTAMP        |DEFAULT CURRENT_TIMESTAMP  |


**Table: doctors**

|Column Name   |Data Type        |Constraints                |
|--------------|-----------------|---------------------------|
|id            |INT              |PRIMARY KEY, AUTO_INCREMENT|
|full_name     |VARCHAR(100)     |NOT NULL                   |
|email         |VARCHAR(150)     |NOT NULL, UNIQUE           |
|password_hash |VARCHAR(255)     |NOT NULL                   |
|specialization|VARCHAR(100)     |NOT NULL                   |
|phone_number  |VARCHAR(20)      |                           |
|bio           |TEXT             |                           |
|created_at    |TIMESTAMP        |DEFAULT CURRENT_TIMESTAMP  |


**Table: appointments**

|Column Name     |Data Type                               |Constraints                         |
|----------------|----------------------------------------|------------------------------------|
|id              |INT                                     |PRIMARY KEY, AUTO_INCREMENT         |
|patient_id      |INT                                     |NOT NULL, FOREIGN KEY → patients(id)|
|doctor_id       |INT                                     |NOT NULL, FOREIGN KEY → patients(id)|
|appointment_time|DATETIME                                |NOT NULL                            |
|duration_minutes|INT                                     |DEFAULT 60                          |
|status          |ENUM('BOOKED', 'CANCELLED', 'COMPLETED')|DEFAULT 'BOOKED'                    |
|created_at      |TIMESTAMP                               |DEFAULT CURRENT_TIMESTAMP           |


**Table: admins**

|Column Name  |Data Type                               |Constraints                |
|-------------|----------------------------------------|---------------------------|
|id           |INT                                     |PRIMARY KEY, AUTO_INCREMENT|
|full_name    |VARCHAR(100)                            |NOT NULL                   |
|email        |VARCHAR(150)                            |NOT NULL, UNIQUE           |
|password_hash|VARCHAR(255)                            |NOT NULL                   |
|role         |VARCHAR(50)                             |DEFAULT 'ADMIN'            |
|created_at   |TIMESTAMP                               |DEFAULT CURRENT_TIMESTAMP  |


**Table: payments**

|Column Name   |Data Type                      |Constraints                   |
|--------------|-------------------------------|------------------------------|
|id            |INT                            |PRIMARY KEY, AUTO_INCREMENT   |
|appointment_id|INT                            |FOREIGN KEY → appointments(id)|
|amount        |DECIMAL(10,2)                  |NOT NULL                      |
|payment_method|VARCHAR(50)                    |NOT NULL                      |
|payment_status|ENUM('PAID','PENDING','FAILED')|DEFAULT 'PENDING'             |
|transaction_id|VARCHAR(100)                   |UNIQUE                        |
|created_at    |TIMESTAMP                      |DEFAULT CURRENT_TIMESTAMP     |


**Table: doctor_availability**

|Column Name   |Data Type                                      |Constraints                |
|--------------|-----------------------------------------------|---------------------------|
|id            |INT                                            |PRIMARY KEY, AUTO_INCREMENT|
|doctor_id     |INT                                            |FOREIGN KEY → doctors(id)  |
|day_of_week   |ENUM('MON','TUE','WED','THU','FRI','SAT','SUN')|NOT NULL                   |
|start_time    |TIME                                           |NOT NULL                   |
|end_time      |TIME                                           |NOT NULL                   |


**Table: clinic_locations**

|Column Name    |Data Type   |Constraints                |
|---------------|------------|---------------------------|
|id             |INT         |PRIMARY KEY, AUTO_INCREMENT|
|name           |VARCHAR(100)|NOT NULL                   |
|address        |TEXT        |NOT NULL                   |
|phone_number   |VARCHAR(20) |NOT NULL                   |
|operating_hours|VARCHAR(100)|NOT NULL                   |



## MongoDB Collection Design

**Collection:**

1. prescriptions

**MongoDB Collection: prescriptions**

Relation to MySQL: appointment_id


Example Document (prescriptions)
{
  "_id": "746353858fhfg465473yegsa",
  "appointment_id": 2048,
  "doctor_id": 63,
  "patient_id": 45,
  "date_issued": "2025-01-01T06:23:00Z",
  "medications": [
    {
      "name": "Lorem ipsum",
      "dosage": "250mg",
      "frequency": "Lorem ipsum",
      "duration_days": 14,
      "notes": "Lorem ipsum"
    },
    {
      "name": "Lorem ipsum",
      "dosage": "250mg",
      "frequency": "Lorem ipsum",
      "duration_days": 7,
      "notes": "Lorem ipsum"
    }
  ],
  "notes": {
    "chief_complaint": "Lorem ipsum dolor sit amet, consectetur adipiscing",
    "diagnosis": "Lorem ipsum dolor sit amet, consectetur adipiscing",
    "recommendations": "Lorem ipsum dolor sit amet, consectetur adipiscing"
  },
  "tags": ["Lorem ipsum", "Lorem ipsum"],
  "attachments": [
    {
      "type": "pdf",
      "file_name": "Lorem ipsum dolor sit amet, consectetur adipiscing",
      "url": "Lorem ipsum dolor sit amet, consectetur adipiscing"
    }
  ],
  "created_at": "2025-01-01T06:23:00Z",
  "last_updated": "2025-01-01T06:23:00Z",
  "version": 1
}





