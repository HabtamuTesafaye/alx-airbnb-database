-- Total number of bookings made by each user
SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM users u
JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id;

-- Rank properties by total number of bookings using rank it gives the same rank while counting if the same count of bokking found
SELECT
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id;

-- Rank properties by total number of bookings in row increment no repated rank
SELECT
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings,
  ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id;
