class Listing < ApplicationRecord
  validates :title, :bedrooms, :bathrooms, :is_available,  presence: true
end
