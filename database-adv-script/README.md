# 📊 Advanced SQL Scripts for Airbnb Clone

This folder contains advanced SQL practice tasks completed as part of the ALX Airbnb Backend Project. The focus was on mastering complex SQL concepts, optimizing database performance, and applying real-world techniques for scalable systems.

### ✅ Covered Topics

- **SQL Joins**: Used INNER, LEFT, and FULL OUTER JOINs to combine user, property, booking, and review data.
- **Subqueries**: Wrote both non-correlated and correlated subqueries for ratings and user activity.
- **Aggregations & Window Functions**: Used COUNT, GROUP BY, and window functions like `ROW_NUMBER` and `RANK` to analyze booking data.
- **Indexing for Optimization**: Identified high-usage columns and created appropriate indexes to improve query performance.
- **Query Performance Tuning**: Used `EXPLAIN` and `ANALYZE` to identify bottlenecks and refactor complex joins.
- **Table Partitioning**: Partitioned the large `bookings` table by `start_date` to improve query efficiency.
- **Performance Monitoring**: Monitored key queries and adjusted schema/indexes for faster data access.

## 📄 File Structure

| File                            | Description |
|---------------------------------|-------------|
| `joins_queries.sql`             | Practice on INNER, LEFT, and FULL OUTER JOINs |
| `subqueries.sql`                | Contains subqueries and correlated subqueries |
| `aggregations_and_window_functions.sql` | Grouping and ranking data using aggregate and window functions |
| `database_index.sql`           | SQL to create indexes for optimization |
| `index_performance.md`         | Observations on performance improvements after indexing |
| `perfomance.sql`               | Complex query joining bookings, users, properties, payments |
| `optimization_report.md`       | Performance analysis and query refactoring notes |
| `partitioning.sql`             | Partitioned the bookings table by start_date |
| `partition_performance.md`     | Query benchmarks before and after partitioning |
| `performance_monitoring.md`    | Monitoring query execution and applying schema adjustments |

## 📚 Reference Documentation

- 🔗 [PostgreSQL Partitioning Guide](https://www.postgresql.org/docs/current/ddl-partitioning.html)
- 🔗 [PostgreSQL Indexing Basics](https://www.postgresql.org/docs/current/indexes.html)
- 🔗 [Understanding EXPLAIN](https://www.postgresql.org/docs/current/using-explain.html)
- 🔗 [Window Functions in PostgreSQL](https://www.postgresql.org/docs/current/functions-window.html)

---

> 💡 This folder serves as both a learning record and a performance enhancement toolkit for the backend system.

