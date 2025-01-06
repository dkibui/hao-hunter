class Listing < ApplicationRecord
  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }

  has_rich_text :description
  has_many_attached :images

  validates :title, :description, :bedrooms, :bathrooms, presence: true
  validates :rent_amount, numericality: true
  validates :bedrooms, :bathrooms, numericality: { only_integer: true,
                                                   greater_than_or_equal_to: 0 }
end
