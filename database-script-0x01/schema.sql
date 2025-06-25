-- Enable UUID generation extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ENUMS
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TYPE payment_method_enum AS ENUM ('credit_card', 'paypal', 'stripe');

-- USERS
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role user_role NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PROPERTIES
CREATE TABLE properties (
    property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    host_id UUID NOT NULL,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    price_per_night DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property_host FOREIGN KEY (host_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- BOOKINGS
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- PAYMENTS
CREATE TABLE payments (
    payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL,
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method payment_method_enum NOT NULL,
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

-- REVIEWS
CREATE TABLE reviews (
    review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- MESSAGES
CREATE TABLE messages (
    message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- INDEXES
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_messages_sender_id ON messages(sender_id);
CREATE INDEX idx_messages_recipient_id ON messages(recipient_id);
