# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data (optional)
Listing.destroy_all

listings = [
  {
    title: "Spacious 2-Bedroom Apartment in Nairobi",
    rent_amount: 50000.0,
    bedrooms: 2,
    bathrooms: 2,
    latitude: -1.286389,
    longitude: 36.817223,
    is_available: true
  },
  {
    title: "Modern Studio Apartment in Westlands",
    rent_amount: 30000.0,
    bedrooms: 1,
    bathrooms: 1,
    latitude: -1.265962,
    longitude: 36.792396,
    is_available: true
  },
  {
    title: "3-Bedroom Family Home in Karen",
    rent_amount: 80000.0,
    bedrooms: 3,
    bathrooms: 4,
    latitude: -1.309717,
    longitude: 36.690578,
    is_available: false
  }
]

Listing.create!(listings)

puts "Seeded #{Listing.count} listings!"