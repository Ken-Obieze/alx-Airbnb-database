# ALX Airbnb Database Project

This repository contains the **database design and implementation** of an Airbnb-like system.  
The project is structured into multiple tasks that gradually build a robust, normalized database system, preparing learners to tackle **real-world database challenges**.  

---

## Objectives
- Design a well-structured relational database for an Airbnb-like application.  
- Apply **ER modeling** and **normalization principles** to ensure data integrity.  
- Create SQL scripts for schema definition, constraints, and indexes.  
- Seed the database with **real-world sample data** to simulate bookings, listings, users, and payments.  

---

## Key Highlights
- **Task 1:** Craft a detailed **Entity-Relationship Diagram (ERD)** to visualize the database design, ensuring clear relationships and properly defined entities.  
- **Task 2:** Apply **normalization principles** to refine the database design, optimizing data integrity and minimizing redundancy.  
- **Task 3:** Create SQL scripts to **define the schema**, incorporating primary keys, foreign keys, and indexes for optimal query performance.  
- **Task 4:** Populate the database with **real-world sample data**, simulating an Airbnb-like environment with users, properties, bookings, reviews, amenities, and payments.  

Each task builds on the previous one, providing a **step-by-step learning journey** through the lifecycle of database development.  

---

## Getting Started

### 1️Clone the repository
```bash
git clone https://github.com/Ken-Obieze/alx-Airbnb-database.git
cd alx-airbnb-database
```
### Create the schema
```bash
psql -U your_user -d your_db -f database-script-0x01/schema.sql
```

### Insert sample data
```bash
psql -U your_user -d your_db -f database-script-0x02/seed.sql
```

### Verify
```sql
SELECT * FROM "User";
SELECT * FROM Property;
SELECT * FROM Booking;
SELECT * FROM Payment;
SELECT * FROM Review;
SELECT * FROM Message;
```

### Tech Stack

* PostgreSQL (primary target database)
* SQL for schema + data population
* ERD Tools (dbdiagram.io, draw.io, or Lucidchart for visualization)