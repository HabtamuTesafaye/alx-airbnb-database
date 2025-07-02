# 🏡 ALX Airbnb Documnation

This repository documents the full design and implementation of a relational database system for an Airbnb-like platform. The database models real-world operations for a property rental application, including users (hosts, guests, admin), properties, bookings, payments, reviews, and messaging.

The project is structured to represent production-grade database planning — from conceptual modeling to implementation and realistic data population — using PostgreSQL.

---

## 📄 About the Repository

This is more than just a SQL script collection. It is a **complete database documentation** resource including:

- Entity-Relationship Design
- Normalization analysis and decisions
- SQL DDL for schema creation
- SQL DML for realistic seed data
- Directory-structured documentation

The repository demonstrates how to go from an abstract idea to a fully operational and documented database that supports real-world scenarios like:

- Multiple user roles and access levels
- Property listings and ownership
- Booking lifecycle management
- Payment handling with diverse methods
- User-generated content (reviews, messages)
- Data integrity through constraints, indexes, and normalization

---

## 📁 Project Structure

```bash
alx-airbnb-database/
├── ERD/
│   ├── airbnb_cloneER.png       # Visual ER diagram of the Airbnb schema
│   └── requirements.md          # Entity descriptions and relationship mapping
│
├── database-script-0x01/
│   ├── schema.sql               # Table creation (DDL): users, properties, bookings, etc.
│   └── README.md                # Schema design explanation and constraints
│
├── database-script-0x02/
│   ├── seed.sql                 # Sample data for testing and querying
│   └── README.md                # Data assumptions and sample record logic
│
├── database-adv-script/         # Advanced SQL + Optimization Tasks
│   ├── joins_queries.sql                # INNER, LEFT, and FULL OUTER JOIN examples
│   ├── subqueries.sql                   # Correlated & non-correlated subqueries
│   ├── aggregations_and_window_functions.sql  # COUNT, RANK, ROW_NUMBER, etc.
│   ├── database_index.sql               # SQL to create indexes on high-usage columns
│   ├── index_performance.md            # Impact analysis of indexes on query speed
│   ├── perfomance.sql                  # Complex query before & after optimization (with EXPLAIN ANALYZE)
│   ├── optimization_report.md         # Report of query refactoring & speedup results
│   ├── partitioning.sql               # Table partitioning by date (range partitioning)
│   ├── partition_performance.md       # Observed performance improvements post-partitioning
│   ├── performance_monitoring.md      # Insights from EXPLAIN/ANALYZE and schema tuning
│   └── README.md                      # Summary of all advanced query work
│
├── normalization.md            # Step-by-step normalization (1NF → 3NF) with applied schema changes
└── README.md                   # You are here 📌
