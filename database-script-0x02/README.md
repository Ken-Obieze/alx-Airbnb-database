# Airbnb Clone – Sample Data

This directory contains **SQL seed scripts** to populate the Airbnb Clone database with sample data.

---

## Files
- **seed.sql** – SQL script that inserts sample lookup data (roles, statuses, payment methods), users, properties, bookings, payments, reviews, and messages.

---

## Sample Data Highlights
- **Users**
  - Alice Johnson (Guest)
  - Bob Smith (Host)
  - Clara Nguyen (Admin)

- **Properties**
  - Cozy Apartment in Downtown (New York, hosted by Bob)
  - Beachfront Villa (Malibu, hosted by Bob)

- **Bookings**
  - Alice books the Downtown Apartment (Confirmed)
  - Alice books the Beachfront Villa (Pending)

- **Payments**
  - Credit card payment for the apartment booking
  - Partial PayPal payment for the villa booking

- **Reviews**
  - Alice reviews both properties

- **Messages**
  - Alice and Bob exchange booking inquiries

---

## Usage

### Run the Seed Script
Assuming you have already created the schema from `database-script-0x01/schema.sql`:

```bash
psql -U your_user -d your_database -f seed.sql
```

### Verify Inserted Data
```sql
SELECT * FROM "User";
SELECT * FROM Property;
SELECT * FROM Booking;
SELECT * FROM Payment;
SELECT * FROM Review;
SELECT * FROM Message;
```