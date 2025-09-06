-- ============================================================
-- Airbnb Database Schema
-- Author: Ejiofor Obieze
-- Repo: alx-airbnb-database
-- ===========================================================
-- This script demonstrates various JOIN operations on the Airbnb database schema.
-- ================================
-- INNER JOIN: Retrieve all bookings and their respective users
-- ================================

SELECT 
    b.id AS booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
ORDER BY b.check_in_date DESC;

-- ================================
-- LEFT JOIN: Retrieve all properties and their reviews (including properties without reviews)
-- ================================
SELECT 
    p.id AS property_id,
    p.title,
    p.location,
    r.id AS review_id,
    r.rating,
    r.comment,
    r.user_id AS reviewer_id
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id
ORDER BY p.id ASC;

-- ================================
-- FULL OUTER JOIN: Retrieve all users and all bookings (even if user has no booking or booking is not linked to a user)
-- ================================
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    b.id AS booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id
ORDER BY u.id NULLS LAST, b.id ASC;