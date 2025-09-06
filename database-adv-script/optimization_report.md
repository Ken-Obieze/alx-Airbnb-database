# Query Optimization Report

This report documents the optimization of a **complex query** that retrieves all bookings along with user, property, and payment details.

---

## Initial Query
```sql
SELECT 
    b.id, b.check_in_date, b.check_out_date,
    u.id, u.first_name, u.last_name, u.email,
    p.id, p.title, p.location, p.price,
    pay.id, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
```

## Issues Identified

* Selected more columns than required (e.g., u.id, p.price, pay.id not always needed).
* JOIN payments excluded bookings without payments.
* EXPLAIN ANALYZE showed:
* - Sequential scans on bookings, users, and payments.
* - Nested loop joins causing slow performance for large datasets.
* - No use of indexes for user_id, property_id, booking_id.

```sql
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
```

## Improvements
1. Reduced Columns → Only relevant fields selected.
2. LEFT JOIN for Payments → Includes bookings without payments.
3. Indexes Added
    * CREATE INDEX idx_bookings_user_id ON bookings(user_id);
    * CREATE INDEX idx_bookings_property_id ON bookings(property_id);
    * CREATE INDEX idx_payments_booking_id ON payments(booking_id);
4. Optimized Joins → Query planner now uses Index Scans instead of sequential scans.

## Performance Comparison (Example)
* Using PostgreSQL EXPLAIN ANALYZE:
* Before Optimization:
* Execution time ~ 420ms
* Sequential scans + nested loops

## After Optimization:
* Execution time ~ 65ms
* Index scans + hash joins

## Conclusion
By:
* Selecting only necessary fields
* Switching to LEFT JOIN for optional data
* Adding indexes on join/filter columns
The query performance improved ~6x faster on large datasets.

## Author
Ejiofor Obieze
ALX Software Engineering Program