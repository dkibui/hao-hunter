class Listing < ApplicationRecord
  validates :title, :bedrooms, :bathrooms,  presence: true
end
