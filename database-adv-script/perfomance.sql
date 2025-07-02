-- Step 1: Initial complex query (potentially inefficient)
EXPLAIN ANALYZE
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  b.status,
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  p.property_id,
  p.name AS property_name,
  p.location,
  pay.payment_id,
  pay.amount,
  pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- Step 2: Refactored optimized query

-- Optimization ideas:
-- - Select only needed columns (drop user_id/property_id if not necessary here)
-- - Remove redundant joins if possible
-- - Use LEFT JOIN only where payments may be missing
-- - Filter by status or date if applicable to reduce rows
-- - Use partitioned bookings table if implemented

EXPLAIN ANALYZE
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  b.status,
  u.first_name,
  u.last_name,
  u.email,
  p.name AS property_name,
  p.location,
  pay.amount,
  pay.payment_method
FROM bookings_partitioned b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-07-01' AND b.start_date < '2025-08-01'
  AND b.status = 'confirmed';
