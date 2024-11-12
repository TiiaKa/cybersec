-- Table for roles (same as before)
CREATE TABLE abc123_role (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(20) NOT NULL UNIQUE
);

-- User table with minimal, pseudonymized, and encrypted fields
CREATE TABLE abc123_user (
    user_id SERIAL PRIMARY KEY,
    username BYTEA NOT NULL UNIQUE,                -- Encrypted username
    password_hash VARCHAR(255) NOT NULL,           -- Hashed password
    email BYTEA,                                   -- Encrypted email
    date_of_birth BYTEA,                           -- Encrypted birth date (if needed)
    is_eligible BOOLEAN NOT NULL,                  -- Eligibility for booking (derived from age)
    role_id INT NOT NULL REFERENCES abc123_role(role_id) ON DELETE CASCADE,
    retention_date DATE,                           -- Marks data for automatic deletion
    deleted_at TIMESTAMP,                          -- Soft delete for "right to be forgotten"
    consent_given BOOLEAN DEFAULT FALSE,           -- Tracks whether consent has been obtained
    consent_timestamp TIMESTAMP                    -- Timestamp of consent for data processing
);

-- Resource table
CREATE TABLE abc123_resource (
    resource_id SERIAL PRIMARY KEY,
    resource_name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    created_by INT REFERENCES abc123_user(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Track creation date for accountability
);

-- Reservation table with pseudonymized user ID and soft delete
CREATE TABLE abc123_reservation (
    reservation_id SERIAL PRIMARY KEY,
    reserver_id_hash BYTEA NOT NULL,               -- Pseudonymized reserver ID
    resource_id INT NOT NULL REFERENCES abc123_resource(resource_id) ON DELETE CASCADE,
    reservation_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of reservation creation
    retention_date DATE,                            -- Marks data for automatic deletion after a period
    deleted_at TIMESTAMP,                           -- Soft delete for user-controlled deletion
    UNIQUE (resource_id, reservation_date, start_time)
);

-- Audit log for tracking actions on user data
CREATE TABLE abc123_audit_log (
    log_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES abc123_user(user_id),
    action TEXT NOT NULL,                            -- Description of action (e.g., "Login", "Data Accessed")
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP    -- Timestamp of the action
);

-- Consent table for tracking consent history (optional)
CREATE TABLE abc123_consent (
    consent_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES abc123_user(user_id) ON DELETE CASCADE,
    consent_type VARCHAR(100) NOT NULL,             -- Type of consent given (e.g., "data processing")
    consent_status BOOLEAN NOT NULL,                -- TRUE if consent given, FALSE if revoked
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP   -- Timestamp of consent action
);

-- Public view, hiding reserver's identity completely for GDPR compliance
CREATE VIEW abc123_public_reservations AS
SELECT
    r.resource_name,
    re.reservation_date,
    re.start_time,
    re.end_time
FROM
    abc123_reservation re
JOIN
    abc123_resource r ON re.resource_id = r.resource_id
WHERE
    re.deleted_at IS NULL;
