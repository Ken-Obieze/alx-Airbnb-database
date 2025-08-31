# Airbnb Clone – Database Requirements

This document outlines the database schema and relationships for the Airbnb Clone project.

## Database Entity Relationship Diagram (ERD)

### Embedded Diagram
![Airbnb Clone ERD](./AirBNB%20Clone.png)

> **Note:** The image above is a snapshot of the ERD generated from [dbdiagram.io](https://dbdiagram.io).

### Interactive ERD Link
You can view and interact with the ERD directly here:  
[View on dbdiagram.io](https://www.dbdiagram.io/d/Air-BNB-Clone-68b3e1dd777b52b76c54dee7)

---

## Entities and Attributes

### User
- **user_id**: UUID (PK, Indexed)
- **first_name**: VARCHAR, NOT NULL  
- **last_name**: VARCHAR, NOT NULL  
- **email**: VARCHAR, UNIQUE, NOT NULL  
- **password_hash**: VARCHAR, NOT NULL  
- **phone_number**: VARCHAR, NULL  
- **role**: ENUM (guest, host, admin), NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### Property
- **property_id**: UUID (PK, Indexed)  
- **host_id**: FK → User(user_id)  
- **name**: VARCHAR, NOT NULL  
- **description**: TEXT, NOT NULL  
- **location**: VARCHAR, NOT NULL  
- **pricepernight**: DECIMAL, NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP  

### Booking
- **booking_id**: UUID (PK, Indexed)  
- **property_id**: FK → Property(property_id)  
- **user_id**: FK → User(user_id)  
- **start_date**: DATE, NOT NULL  
- **end_date**: DATE, NOT NULL  
- **total_price**: DECIMAL, NOT NULL  
- **status**: ENUM (pending, confirmed, canceled), NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### Payment
- **payment_id**: UUID (PK, Indexed)  
- **booking_id**: FK → Booking(booking_id)  
- **amount**: DECIMAL, NOT NULL  
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- **payment_method**: ENUM (credit_card, paypal, stripe), NOT NULL  

### Review
- **review_id**: UUID (PK, Indexed)  
- **property_id**: FK → Property(property_id)  
- **user_id**: FK → User(user_id)  
- **rating**: INT, CHECK (1–5), NOT NULL  
- **comment**: TEXT, NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### Message
- **message_id**: UUID (PK, Indexed)  
- **sender_id**: FK → User(user_id)  
- **recipient_id**: FK → User(user_id)  
- **message_body**: TEXT, NOT NULL  
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
