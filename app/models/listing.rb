class Listing < ApplicationRecord
  has_rich_text :description
  validates :title, :bedrooms, :bathrooms,  presence: true
end
