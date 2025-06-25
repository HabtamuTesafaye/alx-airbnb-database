# Normalization to 3NF

## First Normal Form (1NF)
- All tables are structured with atomic (indivisible) values.
- No repeating groups or arrays.
- Each row is uniquely identified by a primary key.

## Second Normal Form (2NF)
- All non-key attributes in each table depend on the whole primary key.
- Since each table uses a single-column primary key (UUID), all non-key attributes are fully functionally dependent on that key.

## Third Normal Form (3NF)
- All attributes are non-transitively dependent on the primary key.
- No attribute is dependent on another non-key attribute.
- For example, in the `users` table, `role`, `email`, and `phone_number` all directly depend on `user_id`.

## Summary
The current design is fully normalized up to the Third Normal Form (3NF), ensuring minimal redundancy and high data integrity.
