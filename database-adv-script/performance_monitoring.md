# Performance Monitoring Report

### Tools Used
- EXPLAIN ANALYZE
- SHOW PROFILE

### Observations
- Joins between `bookings` and `users` were initially slow due to missing indexes.
- Queries filtering by `start_date` were slow on large tables.

### Actions Taken
- Added indexes on join/filtering columns.
- Partitioned `bookings` by `start_date`.

### Outcome
- Joins now use index scans.
- Date-based queries hit only specific partitions.
- Execution time reduced by ~60% on average.
