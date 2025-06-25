# Entities and Relationships

## Entities
1. `users`: Stores host/guest information
   - Attributes: user_id, first_name, last_name, email, password_hash, phone_number, role, created_at
2. `properties`: Lists rental properties
   - Attributes: property_id, host_id, name, description, location, price_per_night, created_at, updated_at
3. `bookings`: Manages reservation records
   - Attributes: booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
4. `payments`: Tracks financial transactions
   - Attributes: payment_id, booking_id, amount, payment_date, payment_method
5. `reviews`: Stores property feedback
   - Attributes: review_id, property_id, user_id, rating, comment, created_at
6. `messages`: Manages user communications
   - Attributes: message_id, sender_id, recipient_id, message_body, sent_at

## Relationships
- `users(1)` → `properties(many)` (One host owns many properties)
- `users(1)` → `bookings(many)` (One user makes many bookings)
- `properties(1)` → `bookings(many)` (One property has many bookings)
- `bookings(1)` → `payments(1)` (One booking has one payment)
- `properties(1)` → `reviews(many)` (One property has many reviews)
- `users(1)` → `reviews(many)` (One user writes many reviews)
- `users(1)` → `messages(many)` (One user sends/receives many messages)