# Database Normalization – Airbnb Clone

## Objective
To apply database normalization principles and ensure the Airbnb Clone database schema conforms to **Third Normal Form (3NF)**.

---

## Step 1: First Normal Form (1NF)
**Rule:** Eliminate repeating groups and ensure atomic values.

- ✅ All attributes in the current schema are atomic (no multi-valued fields such as storing multiple phone numbers or locations in one column).
- ✅ No repeating groups exist (e.g., no comma-separated lists in a single field).
- ✅ Every row has a unique identifier (Primary Key defined for each table).

**Result:** Schema satisfies 1NF.

---

## Step 2: Second Normal Form (2NF)
**Rule:** Eliminate partial dependencies (i.e., non-key attributes must depend on the whole primary key, not part of it).

- All tables use **UUIDs** as primary keys (single-column PKs).
- Therefore, no risk of partial dependencies.

**Example Check:**
- In **Booking**, `total_price` depends on `booking_id` (whole key), not partially.
- In **Payment**, `amount` depends on `payment_id`, not partially.

**Result:** Schema satisfies 2NF.

---

## Step 3: Third Normal Form (3NF)
**Rule:** Eliminate transitive dependencies (i.e., non-key attributes should depend only on the key, not on another non-key attribute).

### Issues Found
1. **ENUM values in columns**:
   - `User.role` (guest, host, admin)
   - `Booking.status` (pending, confirmed, canceled)
   - `Payment.payment_method` (credit_card, paypal, stripe)

   These ENUMs violate **3NF** because they embed categorical values directly in the table.  
   - If we need to add/change roles or payment methods, schema changes are required.  
   - Better: store them in **lookup/reference tables** and link via foreign keys.

### Adjustments
- Create **Role** table:
  ```sql
  Role(role_id UUID PK, role_name VARCHAR UNIQUE NOT NULL)
