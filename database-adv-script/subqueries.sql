-- Subquery: Properties where average rating > 4.0
SELECT *
FROM properties
WHERE property_id IN (
  SELECT property_id
  FROM reviews
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);

-- Correlated Subquery: Users with more than 3 bookings
SELECT *
FROM users u
WHERE (
  SELECT COUNT(*)
  FROM bookings b
  WHERE b.user_id = u.user_id
) > 3;
