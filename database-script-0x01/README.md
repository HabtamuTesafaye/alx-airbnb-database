# Database Schema

This folder contains the SQL DDL script (`schema.sql`) used to define the Airbnb-style database schema.

## Schema Overview

### Tables

- **users**: Stores all users with roles such as guest, host, and admin.
- **properties**: Listings of properties created by host users.
- **bookings**: Reservations of properties made by guest users.
- **payments**: Payment records tied to specific bookings.
- **reviews**: User-submitted ratings and comments for properties.
- **messages**: Communication between users.

### Constraints and Keys

- All primary keys are UUIDs generated using `uuid_generate_v4()`.
- Foreign keys are used to maintain referential integrity.
- Enum types are used for roles, booking status, and payment method.

### Indexes

- Additional indexes are created on foreign keys and unique fields (e.g., `users.email`) to enhance query performance.

## Requirements

Ensure `uuid-ossp` extension is enabled before using the schema:

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
