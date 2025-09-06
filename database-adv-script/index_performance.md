# Indexing for Performance – Airbnb Clone Database

This document describes the **indexes created** for the `users`, `bookings`, and `properties` tables to optimize query performance. It also includes performance analysis using `EXPLAIN` before and after adding indexes.

---

## Identifying High-Usage Columns

Based on common queries written earlier (joins, aggregations, subqueries, filtering):

- **Users Table**
  - `email` → Frequently used in `WHERE` clauses (login/authentication).
  - `id` → Used in joins with `bookings`.

- **Bookings Table**
  - `user_id` → Used in joins with `users`.
  - `property_id` → Used in joins with `properties`.
  - `check_in_date`, `check_out_date` → Used in range searches and availability checks.

- **Properties Table**
  - `id` → Used in joins with `bookings` and `reviews`.
  - `location` → Used in `WHERE` and `search` queries.
  - `price` → Used in filtering and sorting queries.

---

## SQL Index Creation

```sql
-- Users table indexes
CREATE UNIQUE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- Bookings table indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_dates ON bookings(check_in_date, check_out_date);

-- Properties table indexes
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);
```

## Performance Analysis
### Example 1: Querying users by email
```sql
EXPLAIN ANALYZE 
SELECT * FROM users WHERE email = 'john@example.com';
```

* Before Index: Sequential scan of all rows in users.
* After Index (idx_users_email): Index scan → query time reduced significantly (e.g., from ~50ms to <2ms on large datasets).

### Example 2: Joining bookings with users
```sql
EXPLAIN ANALYZE
SELECT b.id, b.property_id, u.first_name, u.last_name
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;
```

* Before Index: Sequential scan + nested loop join.
* After Index (idx_bookings_user_id): Index scan on bookings.user_id → faster join execution.

### Example 3: Searching properties by location
```sql
EXPLAIN ANALYZE
SELECT * FROM properties WHERE location = 'Lagos';
```

* Before Index: Full table scan.
* After Index (idx_properties_location): Index scan → faster lookups, especially with large property datasets.

## Summary of Improvements

* Login queries (users.email) are now O(log n) instead of O(n).
* Joins between users, bookings, and properties now use index scans, reducing execution time.
* Property searches by location/price are optimized for faster filtering.
* Date range queries on bookings benefit from composite index (check_in_date, check_out_date).

## Author
Ejiofor Obieze
ALX Software Engineering Program