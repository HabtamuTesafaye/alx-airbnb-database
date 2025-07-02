-- INNER JOIN: Bookings and respective users
SELECT b.*, u.first_name, u.last_name, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;

-- LEFT JOIN: All properties and their reviews, including properties with no reviews
SELECT 
  p.property_id,
  p.name AS property_name,
  r.rating,
  r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY p.property_id;


-- FULL OUTER JOIN: All users and all bookings
SELECT u.user_id, u.first_name, b.booking_id, b.property_id, b.start_date, b.end_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
