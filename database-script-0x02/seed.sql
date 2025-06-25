-- USERS
INSERT INTO users (first_name, last_name, email, password_hash, role) VALUES
('Emma', 'Wilson', 'emma@example.com', 'hash1', 'host'),
('Noah', 'Adams', 'noah@example.com', 'hash2', 'host'),
('Liam', 'Chen', 'liam@example.com', 'hash3', 'guest'),
('Olivia', 'Brown', 'olivia@example.com', 'hash4', 'guest'),
('Ava', 'Admin', 'ava@example.com', 'hash5', 'admin');

-- PROPERTIES
INSERT INTO properties (host_id, name, description, location, price_per_night) VALUES
((SELECT user_id FROM users WHERE email='emma@example.com'), 'Beach Villa', 'Ocean view in Miami', 'Miami', 250.00),
((SELECT user_id FROM users WHERE email='emma@example.com'), 'Mountain Cabin', 'Cozy winter cabin', 'Aspen', 180.00),
((SELECT user_id FROM users WHERE email='emma@example.com'), 'City Loft', 'Modern loft downtown', 'New York', 220.00),
((SELECT user_id FROM users WHERE email='noah@example.com'), 'Desert Retreat', 'Peaceful getaway', 'Phoenix', 150.00),
((SELECT user_id FROM users WHERE email='noah@example.com'), 'Lake House', 'Waterfront home', 'Chicago', 200.00),
((SELECT user_id FROM users WHERE email='noah@example.com'), 'Countryside BnB', 'Quiet and green', 'Vermont', 140.00),
((SELECT user_id FROM users WHERE email='emma@example.com'), 'Skyline Apartment', 'Skyscraper views', 'New York', 300.00),
((SELECT user_id FROM users WHERE email='noah@example.com'), 'Urban Flat', 'Simple and clean', 'Chicago', 100.00);

-- BOOKINGS
INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status) VALUES
((SELECT property_id FROM properties WHERE name='Beach Villa'), (SELECT user_id FROM users WHERE email='liam@example.com'), '2025-07-01', '2025-07-05', 1000.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Mountain Cabin'), (SELECT user_id FROM users WHERE email='olivia@example.com'), '2025-12-20', '2025-12-27', 1260.00, 'pending'),
((SELECT property_id FROM properties WHERE name='City Loft'), (SELECT user_id FROM users WHERE email='liam@example.com'), '2025-08-01', '2025-08-04', 660.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Desert Retreat'), (SELECT user_id FROM users WHERE email='olivia@example.com'), '2025-06-15', '2025-06-18', 450.00, 'canceled'),
((SELECT property_id FROM properties WHERE name='Lake House'), (SELECT user_id FROM users WHERE email='liam@example.com'), '2025-07-10', '2025-07-14', 800.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Countryside BnB'), (SELECT user_id FROM users WHERE email='olivia@example.com'), '2025-10-01', '2025-10-05', 560.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Skyline Apartment'), (SELECT user_id FROM users WHERE email='liam@example.com'), '2025-09-05', '2025-09-08', 900.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Urban Flat'), (SELECT user_id FROM users WHERE email='olivia@example.com'), '2025-11-01', '2025-11-03', 200.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Lake House'), (SELECT user_id FROM users WHERE email='liam@example.com'), '2025-07-20', '2025-07-25', 1000.00, 'pending'),
((SELECT property_id FROM properties WHERE name='Mountain Cabin'), (SELECT user_id FROM users WHERE email='olivia@example.com'), '2025-12-01', '2025-12-04', 540.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Countryside BnB'), (SELECT user_id FROM users WHERE email='liam@example.com'), '2025-10-10', '2025-10-12', 280.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Desert Retreat'), (SELECT user_id FROM users WHERE email='olivia@example.com'), '2025-06-01', '2025-06-03', 300.00, 'confirmed');

-- PAYMENTS
INSERT INTO payments (booking_id, amount, payment_method) VALUES
((SELECT booking_id FROM bookings WHERE total_price=1000.00 LIMIT 1), 1000.00, 'credit_card'),
((SELECT booking_id FROM bookings WHERE total_price=660.00), 660.00, 'paypal'),
((SELECT booking_id FROM bookings WHERE total_price=800.00), 800.00, 'stripe'),
((SELECT booking_id FROM bookings WHERE total_price=560.00), 560.00, 'credit_card'),
((SELECT booking_id FROM bookings WHERE total_price=900.00), 900.00, 'paypal'),
((SELECT booking_id FROM bookings WHERE total_price=200.00), 200.00, 'stripe'),
((SELECT booking_id FROM bookings WHERE total_price=540.00), 540.00, 'credit_card'),
((SELECT booking_id FROM bookings WHERE total_price=280.00), 280.00, 'paypal'),
((SELECT booking_id FROM bookings WHERE total_price=300.00), 300.00, 'credit_card');

-- REVIEWS
INSERT INTO reviews (property_id, user_id, rating, comment) VALUES
((SELECT property_id FROM properties WHERE name='Beach Villa'), (SELECT user_id FROM users WHERE email='liam@example.com'), 5, 'Fantastic view and service!'),
((SELECT property_id FROM properties WHERE name='Lake House'), (SELECT user_id FROM users WHERE email='liam@example.com'), 4, 'Peaceful and beautiful.'),
((SELECT property_id FROM properties WHERE name='Countryside BnB'), (SELECT user_id FROM users WHERE email='olivia@example.com'), 5, 'So relaxing and green!'),
((SELECT property_id FROM properties WHERE name='Skyline Apartment'), (SELECT user_id FROM users WHERE email='liam@example.com'), 5, 'Best skyline ever!'),
((SELECT property_id FROM properties WHERE name='Urban Flat'), (SELECT user_id FROM users WHERE email='olivia@example.com'), 3, 'Good for short stays.');

-- MESSAGES
INSERT INTO messages (sender_id, recipient_id, message_body) VALUES
((SELECT user_id FROM users WHERE email='liam@example.com'), (SELECT user_id FROM users WHERE email='emma@example.com'), 'Is early check-in possible?'),
((SELECT user_id FROM users WHERE email='emma@example.com'), (SELECT user_id FROM users WHERE email='liam@example.com'), 'Yes, from 1 PM.'),
((SELECT user_id FROM users WHERE email='olivia@example.com'), (SELECT user_id FROM users WHERE email='noah@example.com'), 'Can I bring my dog?'),
((SELECT user_id FROM users WHERE email='noah@example.com'), (SELECT user_id FROM users WHERE email='olivia@example.com'), 'Pets are welcome!'),
((SELECT user_id FROM users WHERE email='liam@example.com'), (SELECT user_id FROM users WHERE email='emma@example.com'), 'Thanks for hosting.'),
((SELECT user_id FROM users WHERE email='emma@example.com'), (SELECT user_id FROM users WHERE email='liam@example.com'), 'My pleasure!'),
((SELECT user_id FROM users WHERE email='olivia@example.com'), (SELECT user_id FROM users WHERE email='noah@example.com'), 'Is parking available?'),
((SELECT user_id FROM users WHERE email='noah@example.com'), (SELECT user_id FROM users WHERE email='olivia@example.com'), 'Yes, free parking onsite.');
