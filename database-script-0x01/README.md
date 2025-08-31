# Airbnb Clone Database Schema

This directory contains the **SQL schema definition** for the Airbnb Clone project.  
The schema follows **Third Normal Form (3NF)** for efficiency, consistency, and scalability.

---

## Files

- **schema.sql** – SQL script to create the database schema.
- **README.md** – Documentation for the schema.

---

## Schema Overview

The database consists of the following tables:

### Lookup Tables
- **Role** – Stores user roles (guest, host, admin).
- **BookingStatus** – Stores booking statuses (pending, confirmed, canceled).
- **PaymentMethod** – Stores supported payment methods (credit_card, paypal, stripe).

### Core Entities
- **User** – Stores user details.
- **Property** – Stores property details listed by hosts.
- **Booking** – Stores booking records for properties.
- **Payment** – Stores payment transactions.
- **Review** – Stores user reviews of properties.
- **Message** – Stores user-to-user messages.

---

## Relationships
- A **User** has a role (`Role`).
- A **Property** belongs to a **User** (host).
- A **Booking** links a **User** (guest) to a **Property**, with a **status**.
- A **Payment** belongs to a **Booking**, with a **payment method**.
- A **Review** belongs to both a **User** and a **Property**.
- A **Message** is sent from one **User** to another.

---

## Usage

### Create the Database

```bash
psql -U your_user -d your_database -f schema.sql
```
