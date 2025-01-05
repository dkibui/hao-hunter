class Listing < ApplicationRecord
  has_rich_text :description
  validates :title, :description, :bedrooms, :bathrooms, presence: true
  validates :rent_amount, numericality: true
  validates :bedrooms, :bathrooms, numericality: { only_integer: true,
                                                   greater_than_or_equal_to: 0 }
end
