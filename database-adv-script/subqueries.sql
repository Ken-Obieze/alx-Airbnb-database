-- ============================================================
-- Airbnb Database Schema
-- Author: Ejiofor Obieze
-- Repo: alx-airbnb-database
-- ===========================================================

-- ==========================================
-- Subqueries for Airbnb Clone Database
-- ==========================================

-- 1. Non-Correlated Subquery:
-- Find all properties where the average rating is greater than 4.0
SELECT 
    p.id AS property_id,
    p.title,
    p.location
FROM properties p
WHERE (
    SELECT AVG(r.rating)
    FROM reviews r
    WHERE r.property_id = p.id
) > 4.0;

-- ==========================================

-- 2. Correlated Subquery:
-- Find all users who have made more than 3 bookings
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
