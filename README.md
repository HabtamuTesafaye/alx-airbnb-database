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
│   └── requirements.md         # Entity-Relationship Diagram and entity descriptions
├── database-script-0x01/
│   ├── schema.sql              # SQL DDL: Tables, Enums, Keys, Indexes
│   └── README.md               # Design summary for the schema
├── database-script-0x02/
│   ├── seed.sql                # SQL DML: Insert sample data
│   └── README.md               # Seed data contents and assumptions
└── normalization.md            # Explanation of 1NF, 2NF, 3NF with applied changes
