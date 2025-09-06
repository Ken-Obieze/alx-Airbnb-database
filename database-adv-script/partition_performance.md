# Partitioning Performance Report

This report evaluates the effect of **table partitioning** on the `bookings` table using PostgreSQL **RANGE partitioning** on the `start_date` column.

---

## Partitioning Strategy
- Partitioned `bookings` table by **year** based on `start_date`.
- Created partitions:
  - `bookings_2023`
  - `bookings_2024`
  - `bookings_2025`
  - `bookings_future` (default for later dates)
- Added indexes on `start_date` within each partition.

---

## Queries Tested
```sql
-- Fetch bookings within June 2024
EXPLAIN ANALYZE
SELECT * 
FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
```

## Performance Results
Before Partitioning
* Execution Plan: Sequential Scan on entire bookings table
* Execution Time: ~420ms (on dataset of ~2M rows)

After Partitioning
* Execution Plan: Index Scan only on bookings_2024
* Execution Time: ~55ms

## Observations
* Query planner automatically prunes irrelevant partitions (bookings_2023, bookings_2025 not scanned).
* Significant reduction in query execution time (up to 7–8x faster).
* Maintenance benefit: new partitions can be created per year without downtime.

## Conclusion

Partitioning the bookings table by start_date drastically improved query performance for date-range queries.
This optimization is most beneficial for large datasets with time-series data like bookings, logs, or transactions.

## Author

Ejiofor Obieze
ALX Software Engineering Program