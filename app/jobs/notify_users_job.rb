class NotifyUsersJob < ApplicationJob
  queue_as :default

  def perform(listing, message, user_ids)
    user_ids.each do |user_id|
      Notification.create!(
        user_id: user_id,
        listing_id: listing.id,
        message: message
      )
    end
  end
end