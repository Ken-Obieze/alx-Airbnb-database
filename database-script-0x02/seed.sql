-- ============================================================
-- Airbnb Database Sample Data (Seed)
-- Author: Ejiofor Obieze
-- Repo: alx-airbnb-database
-- ============================================================

-- Roles
INSERT INTO Role (role_id, role_name) VALUES
    (uuid_generate_v4(), 'guest'),
    (uuid_generate_v4(), 'host'),
    (uuid_generate_v4(), 'admin');

-- Booking Status
INSERT INTO BookingStatus (status_id, status_name) VALUES
    (uuid_generate_v4(), 'pending'),
    (uuid_generate_v4(), 'confirmed'),
    (uuid_generate_v4(), 'canceled');

-- Payment Methods
INSERT INTO PaymentMethod (method_id, method_name) VALUES
    (uuid_generate_v4(), 'credit_card'),
    (uuid_generate_v4(), 'paypal'),
    (uuid_generate_v4(), 'stripe');

-- ========================
-- Insert Users
-- ========================
-- Assume we fetch role_ids dynamically for realistic seeding
-- Example uses subqueries to avoid hardcoding UUIDs

INSERT INTO "User" (first_name, last_name, email, password_hash, phone_number, role_id)
VALUES
    ('Alice', 'Johnson', 'alice@example.com', 'hashedpassword123', '1234567890',
        (SELECT role_id FROM Role WHERE role_name = 'guest')),
    ('Bob', 'Smith', 'bob@example.com', 'hashedpassword456', '0987654321',
        (SELECT role_id FROM Role WHERE role_name = 'host')),
    ('Clara', 'Nguyen', 'clara@example.com', 'hashedpassword789', '1122334455',
        (SELECT role_id FROM Role WHERE role_name = 'admin'));

-- ========================
-- Insert Properties
-- ========================

INSERT INTO Property (host_id, name, description, location, pricepernight)
VALUES
    ((SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
     'Cozy Apartment in Downtown',
     'A modern 2-bedroom apartment with city view',
     'New York, USA',
     120.00),
    ((SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
     'Beachfront Villa',
     'Luxury villa right on the beach with private pool',
     'Malibu, USA',
     500.00);

-- ========================
-- Insert Bookings
-- ========================

INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status_id)
VALUES
    ((SELECT property_id FROM Property WHERE name = 'Cozy Apartment in Downtown'),
     (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
     '2025-09-10', '2025-09-15', 600.00,
     (SELECT status_id FROM BookingStatus WHERE status_name = 'confirmed')),

    ((SELECT property_id FROM Property WHERE name = 'Beachfront Villa'),
     (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
     '2025-12-20', '2025-12-25', 2500.00,
     (SELECT status_id FROM BookingStatus WHERE status_name = 'pending'));

-- ========================
-- Insert Payments
-- ========================

INSERT INTO Payment (booking_id, amount, method_id)
VALUES
    ((SELECT booking_id FROM Booking WHERE total_price = 600.00),
     600.00,
     (SELECT method_id FROM PaymentMethod WHERE method_name = 'credit_card')),

    ((SELECT booking_id FROM Booking WHERE total_price = 2500.00),
     1000.00,
     (SELECT method_id FROM PaymentMethod WHERE method_name = 'paypal'));

-- ========================
-- Insert Reviews
-- ========================

INSERT INTO Review (property_id, user_id, rating, comment)
VALUES
    ((SELECT property_id FROM Property WHERE name = 'Cozy Apartment in Downtown'),
     (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
     5,
     'Amazing stay! The apartment was clean and close to everything.'),

    ((SELECT property_id FROM Property WHERE name = 'Beachfront Villa'),
     (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
     4,
     'Beautiful villa but quite expensive.');

-- ========================
-- Insert Messages
-- ========================

INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES
    ((SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
     (SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
     'Hi Bob, I’m interested in booking the beachfront villa for December!'),

    ((SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
     (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
     'Hi Alice, sure! The villa is available during that time.');
