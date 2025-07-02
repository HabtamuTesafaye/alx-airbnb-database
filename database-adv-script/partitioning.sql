-- Run EXPLAIN ANALYZE again after optimizations
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.total_price, u.first_name, u.email, p.name AS property_name
FROM bookings_partitioned b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-07-01' AND '2025-07-31';


-- Create partitioned table
CREATE TABLE bookings_partitioned (
  booking_id UUID DEFAULT uuid_generate_v4(),
  property_id INT,
  user_id INT,
  start_date DATE,
  end_date DATE,
  total_price NUMERIC,
  status TEXT,
  PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions
CREATE TABLE bookings_2025_q1 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE bookings_2025_q2 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE bookings_2025_q3 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE bookings_2025_q4 PARTITION OF bookings_partitioned
  FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');