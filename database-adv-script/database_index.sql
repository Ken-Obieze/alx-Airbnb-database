-- =======================================
-- Database Indexing for Performance
-- =======================================

-- 1. Index on bookings.user_id (frequent WHERE and JOIN clause)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- 2. Index on reviews.property_id (frequent GROUP BY and JOIN clause)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- 3. Composite index on properties(location, price) (frequent WHERE filter)
CREATE INDEX idx_properties_location_price ON properties(location, price);

-- =======================================
-- Test Queries with EXPLAIN ANALYZE
-- =======================================

-- Query 1: Get all bookings for a given user
EXPLAIN ANALYZE
SELECT b.id, b.start_date, b.end_date, p.title
FROM bookings b
JOIN properties p ON b.property_id = p.id
WHERE b.user_id = 123;

-- Query 2: Find average rating per property
EXPLAIN ANALYZE
SELECT property_id, AVG(rating)
FROM reviews
GROUP BY property_id;

-- Query 3: Search properties by location and price
EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE location = 'Lagos'
  AND price BETWEEN 50 AND 150;
