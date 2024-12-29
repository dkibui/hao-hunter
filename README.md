# Hao hunting Application

## Overview
The Rental Finder Application is a web-based platform designed to help house hunters in Kenya, especially around Nairobi, find rental properties easily. Users can search for properties, apply advanced filters, and receive notifications for properties they’re interested in. Apartment managers can list properties, manage their availability, and include detailed descriptions and photos.

## Features

### For House Hunters
- **Search and Filters**: Search for properties by geographical area, rental amount, number of bedrooms, and other attributes.
- **Property Details**: View comprehensive information about each listing, including photos and descriptions.
- **Notifications**: Receive alerts when properties matching saved preferences become available.

### For Apartment Managers
- **Property Management**: Create and manage listings, including descriptions, rental amounts, and photos.
- **Account Management**: Manage profiles and view responses to listed properties.

### General Features
- **User Authentication**: Secure login and registration for both house hunters and apartment managers.
- **Geolocation Integration**: Map-based search and radius filters for properties.
- **Media Upload**: Upload and manage property photos.

## Tech Stack

### Backend
- **Framework**: Ruby on Rails
- **Database**: PostgreSQL with PostGIS extension for geospatial data
- **Search Engine**: PgSearch or Elasticsearch for advanced filtering

### Frontend
- **JavaScript**: Hotwire (Turbo/Stimulus) for interactivity

### Infrastructure
I make no hosting recommendation because all available hosting services
would work well for this application. Feel free to choose what you prefer here.

## Getting Started

### Prerequisites
As seen in the Gemfile dependencies. Here are the versions of Ruby  and Ruby
on Rails.
- Ruby 3.3.3
- Rails 8.0.1
- PostgreSQL with PostGIS
- Docker (optional, for containerized development)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/dkibui/hao-hunting
   cd hao-hunting
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the server:
   ```bash
   rails server
   ```
   Access the application at `http://localhost:3000`

## Project Structure
- **app/models**: Contains the application’s core business logic and data models.
- **app/controllers**: Handles incoming requests and responses.
- **app/views**: Contains templates for rendering the frontend.
- **config**: Configuration files for the application and its dependencies.
- **db**: Database migrations and schema files.

## Contribution Guidelines
1. Fork the repository and create a new branch.
2. Commit changes with clear messages.
3. Submit a pull request for review.

## Contact
For questions or suggestions, please contact dkibui@outlook.com.

