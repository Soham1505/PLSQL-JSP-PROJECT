-- ================================
-- HOSPITAL DATABASE SETUP SCRIPT
-- ================================

-- ================================
-- TABLES
-- ================================

-- Table: DOCTORS
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR2(50) NOT NULL
);

-- Table: APPOINTMENTS
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_name VARCHAR2(50) NOT NULL,
    patient_email VARCHAR2(100) NOT NULL,
    appointment_date DATE NOT NULL,
    doctor_id INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- ================================
-- SEQUENCES
-- ================================

-- Sequence: APPOINTMENTS_SEQ
CREATE SEQUENCE appointments_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- ================================
-- TRIGGERS
-- ================================

-- Trigger: PREVENT_PAST_DATE_APPOINTMENTS
CREATE OR REPLACE TRIGGER check_appointment_date
BEFORE INSERT ON appointments
FOR EACH ROW
BEGIN
    IF :new.appointment_date < SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20002, 'Appointment date cannot be in the past.');
    END IF;
END;
/

-- ================================
-- PROCEDURES
-- ================================

-- Procedure: BOOK_APPOINTMENT
CREATE OR REPLACE PROCEDURE book_appointment (
    p_patient_name IN VARCHAR2,
    p_patient_email IN VARCHAR2,
    p_appointment_date IN DATE,
    p_doctor_id IN NUMBER
) AS
BEGIN
    INSERT INTO appointments (
        appointment_id, 
        patient_name, 
        patient_email, 
        appointment_date, 
        doctor_id
    ) VALUES (
        appointments_seq.NEXTVAL, 
        p_patient_name, 
        p_patient_email, 
        p_appointment_date, 
        p_doctor_id
    );
    COMMIT;
END book_appointment;
/

-- ================================
-- VIEWS
-- ================================

-- View: APPOINTMENTS_OVERVIEW
CREATE OR REPLACE VIEW appointments_overview AS
SELECT
    a.appointment_id,
    a.patient_name,
    a.patient_email,
    a.appointment_date,
    d.doctor_name
FROM
    appointments a
JOIN
    doctors d ON a.doctor_id = d.doctor_id;

-- ================================
-- FUNCTIONS
-- ================================

-- Function: CANCEL_APPOINTMENT
CREATE OR REPLACE FUNCTION cancel_appointment (
    p_appointment_id IN NUMBER
) RETURN VARCHAR IS
BEGIN
    UPDATE appointments
    SET appointment_status = 'cancelled'
    WHERE appointment_id = p_appointment_id;

    IF SQL%ROWCOUNT = 0 THEN
        RETURN 'Appointment not found.';
    ELSE
        COMMIT;
        RETURN 'Appointment cancelled successfully.';
    END IF;
END cancel_appointment;
/
