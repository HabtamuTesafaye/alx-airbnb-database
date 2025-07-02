-- Run this BEFORE creating indexes to measure baseline
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, u.first_name, u.email, p.name AS property_name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-07-01' AND '2025-07-31';

-- Indexes for Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index for Users table (if joined or filtered by email or user_id)
CREATE INDEX idx_users_email ON users(email);

-- Indexes for Properties table
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);

-- Index for Reviews table (for joins)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Run this AFTER creating indexes to see improvements
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, u.first_name, u.email, p.name AS property_name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-07-01' AND '2025-07-31';
