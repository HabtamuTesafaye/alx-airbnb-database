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