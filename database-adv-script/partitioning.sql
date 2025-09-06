-- ============================================================
-- Airbnb Database Schema
-- Author: Ejiofor Obieze
-- Repo: alx-airbnb-database
-- ===========================================================

-- =======================================
-- Partitioning the Bookings Table
-- =======================================

-- 1. Rename original bookings table (backup before partitioning)
ALTER TABLE bookings RENAME TO bookings_backup;

-- 2. Create new parent table with PARTITION BY RANGE
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 3. Create partitions by year
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. Optional: Create default partition for future records
CREATE TABLE bookings_future PARTITION OF bookings
    DEFAULT;

-- 5. Indexes on partitions
CREATE INDEX idx_bookings_2023_start_date ON bookings_2023(start_date);
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024(start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025(start_date);

-- 6. Insert data back from backup
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, status, created_at)
SELECT id, user_id, property_id, start_date, end_date, status, created_at
FROM bookings_backup;

-- =======================================
-- Test Query on Partitioned Table
-- Fetch bookings within a date range
-- =======================================
EXPLAIN ANALYZE
SELECT * 
FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
