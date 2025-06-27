# 🗃️ Airbnb Clone - Seed Data Overview

This document provides a summary of the initial dataset seeded into the backend database of the Airbnb Clone project. The data was written in **SQL** and is used to simulate realistic application usage for testing, development, and demonstration purposes.

### Contents:
- 5 users (2 hosts, 2 guests, 1 admin)
- 8 properties across 4 locations
- 12 bookings with varying statuses
- Corresponding payments and reviews
- 15+ messages between users

## Realism Features:
- Overlapping booking dates
- Mixed payment methods
- Diverse property types (Beach villa, City loft, Mountain cabin, etc.)
- Seasonal pricing variations

## 🧪 Purpose

The seed data helps developers:

- Validate backend feature implementations (e.g., booking, messaging, payments).
- Demonstrate user roles and flows (e.g., guest booking, host listing).
- Populate frontend interfaces with realistic content.

## 🛠️ Technology

- **Language**: SQL (PostgreSQL syntax)
- **Insertion method**: `INSERT INTO` statements using subqueries for foreign key references

## 📊 Seed Data Summary

| Table       | Description                      | Records Seeded |
|-------------|----------------------------------|----------------|
| `users`     | Guests, Hosts, Admin accounts    | 5              |
| `properties`| Listings posted by hosts         | 8              |
| `bookings`  | Booking records by guests        | 12             |
| `payments`  | Associated with bookings         | 9              |
| `reviews`   | Guest feedback for properties    | 5              |
| `messages`  | Conversations between users      | 8              |

## 👤 Users

The dataset includes five users:
- Two **hosts** (`emma@example.com`, `noah@example.com`)
- Two **guests** (`liam@example.com`, `olivia@example.com`)
- One **admin** (`ava@example.com`)

Each user has basic profile information, a hashed password, and a predefined role.

✅ **Example:**
> Liam Chen (Guest) – `liam@example.com`  
> Emma Wilson (Host) – `emma@example.com`

## 🏡 Properties

A total of **8 properties** are added, associated with the two hosts. Each property includes:
- Name (e.g., *Beach Villa*, *Mountain Cabin*)
- Description, location, and nightly price

✅ **Example:**
> *Beach Villa* – Hosted by Emma in **Miami**, priced at **$250/night**

## 📆 Bookings

**12 bookings** are seeded. Each booking includes:
- Property reference
- Guest reference
- Start and end dates
- Total price
- Status (`confirmed`, `pending`, or `canceled`)

✅ **Example:**
> Liam booked *Beach Villa* from **2025-07-01 to 2025-07-05** – Total: **$1000**, Status: **confirmed**

## 💰 Payments

The database includes **9 payment** records tied to bookings. Each payment includes:
- Booking ID
- Payment amount
- Payment method (`credit_card`, `paypal`, `stripe`)

✅ **Example:**
> Booking payment of **$900** via **PayPal**

## ⭐ Reviews

Guests have left **5 reviews** linked to past bookings. Each review includes:
- A rating between 1–5
- A comment and timestamp
- Association with both property and reviewer

✅ **Example:**
> “Fantastic view and service!” – 5⭐ by Liam for *Beach Villa*

## 💬 Messages

There are **8 messages** simulating guest-host communication. These help test messaging features and UI.

✅ **Example:**
> Liam → Emma: “Is early check-in possible?”  
> Emma → Liam: “Yes, from 1 PM.”

---

## 🧾 Notes

- All `INSERT` operations were designed to respect foreign key constraints using subqueries (e.g., looking up `user_id` via email).
- The data supports end-to-end functionality, from listing to booking, payment, review, and messaging.

---

## ✅ Next Steps

You can find the seed script in the `seed.sql` file within the backend repository. Be sure to apply the database schema before running the seed.

