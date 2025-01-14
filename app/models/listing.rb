class Listing < ApplicationRecord
  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }

  has_rich_text :description
  has_many_attached :images
  has_many :notifications, dependent: :destroy
  has_many :users, through: :notifications

  validates :title, :description, :bedrooms, :bathrooms, presence: true
  validates :rent_amount, numericality: true
  validates :bedrooms, :bathrooms, numericality: { only_integer: true,
                                                   greater_than_or_equal_to: 0 }

  private

  def notify_users_of_changes
    changes_to_track = []
    changes_to_track << "rent amount" if saved_change_to_rent_amount

    nil if changes_to_track.empty?

    message = "The #{changes_to_track} of listing #{title}"

    users_to_notify.each do |user|
      Notification.create!(
        user: user,
        listing: self,
        message: message
      )
    end

    def users_to_notify
      User.joins(:notifications).where(notifications: { listing_id: id })
    end
  end
end
