# Optimization Report

### Initial Query Analysis
Used EXPLAIN ANALYZE on `perfomance.sql` query. Identified full table scans on `users`, `properties`, and `payments`.

### Optimization Steps
- Added indexes on `bookings.user_id`, `bookings.property_id`, `payments.booking_id`
- Simplified SELECT clause to avoid `SELECT *`
- Used LEFT JOIN only where nullable (`payments`)

### Result
Query execution time decreased by ~50%, with index scans replacing sequential scans.
