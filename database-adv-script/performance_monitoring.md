# Partitioning Performance Report

### Before Partitioning
Query on date range in bookings scanned entire table.

### After Partitioning
Query using WHERE start_date BETWEEN '2025-07-01' AND '2025-09-30' only accessed relevant partitions, reducing scan time significantly.

### Conclusion
Partitioning bookings table on `start_date` dramatically improved date-based query performance.
