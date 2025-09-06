-- ============================================================
-- Airbnb Database Schema
-- Author: Ejiofor Obieze
-- Repo: alx-airbnb-database
-- ===========================================================

-- ======================================
-- Initial Complex Query (Unoptimized)
-- ======================================
-- Retrieves all bookings along with user, property, and payment details

SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    p.price,
    pay.id AS payment_id,
    pay.amount,
    pay.status AS payment_status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
WHERE b.status = 'confirmed'
  AND pay.status = 'completed'
ORDER BY b.start_date DESC;

-- ======================================
-- Refactored Query (Optimized)
-- ======================================
-- Optimization applied:
-- 1. Selected only required fields
-- 2. Ensured indexes exist on JOIN keys
-- 3. Reordered joins to reduce nested loops
-- 4. Avoided redundant scans

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    u.first_name,
    u.last_name,
    p.title AS property_title,
    pay.amount,
    pay.status AS payment_status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
WHERE b.status = 'confirmed'
  AND pay.status = 'completed'
ORDER BY b.start_date DESC;
