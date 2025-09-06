-- ============================================================
-- Airbnb Database Schema
-- Author: Ejiofor Obieze
-- Repo: alx-airbnb-database
-- ===========================================================

-- ==========================================
-- Aggregations and Window Functions
-- Airbnb Clone Database
-- ==========================================

-- 1. Aggregation:
-- Find the total number of bookings made by each user
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- ==========================================

-- 2. Window Function:
-- Rank properties based on the total number of bookings they have received
SELECT 
    p.id AS property_id,
    p.title,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.title
ORDER BY booking_rank;
