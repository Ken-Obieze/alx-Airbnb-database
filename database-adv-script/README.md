# Advanced Database Scripts – Airbnb Clone

This directory contains **advanced SQL scripts and performance reports** developed for the **Airbnb Clone database**.  
The scripts demonstrate complex queries, performance optimization, and monitoring techniques.

---

## Contents

### 0️ Complex Joins
- **File:** `joins_queries.sql`  
- **Description:** Examples of `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN` queries.

---

### 1️ Subqueries
- **File:** `subqueries.sql`  
- **Description:** Demonstrates **correlated** and **non-correlated** subqueries.  

---

### 2️ Aggregations & Window Functions
- **File:** `aggregations_and_window_functions.sql`  
- **Description:**  
  - Aggregation queries using `COUNT`, `GROUP BY`.  
  - Ranking queries using `ROW_NUMBER` and `RANK` window functions.

---

### 3️ Index Performance
- **File:** `index_performance.md`  
- **Description:**  
  - Identifies high-usage columns for indexing.  
  - Shows query performance **before and after indexes**.  

---

### 4️ Query Optimization
- **Files:**  
  - `perfomance.sql` → Original and optimized queries for bookings with users, properties, and payments.  
  - `optimization_report.md` → Analysis of inefficiencies and improvements.  

---

### 5️ Table Partitioning
- **Files:**  
  - `partitioning.sql` → Implements partitioning of the `bookings` table by `start_date`.  
  - `partition_performance.md` → Performance improvements after partitioning.  

---

### 6️ Performance Monitoring
- **File:** `performance_monitoring.md`  
- **Description:**  
  - Used `EXPLAIN ANALYZE` to monitor frequently used queries.  
  - Suggested schema adjustments (indexes, composite indexes, partitioning).  
  - Reported execution time improvements.  

---

## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/Ken-Obieze/alx-Airbnb-database.git
   cd alx-airbnb-database/database-adv-script
   ```
2. Run SQL scripts inside your PostgreSQL/MySQL client:
   ```bash
   \i joins_queries.sql
   ```
3. Review performance reports (.md files) for explanations and optimizations.

## Author
Ejiofor Obieze
ALX Software Engineering Program
