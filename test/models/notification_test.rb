require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  test "should belong to user and listing" do
    notification = notifications(:notification_one)
    assert notification.user.present?
    assert notification.listing.present?
  end

  test "should validate presence of message" do
    notification = Notification.new
    assert_not notification.valid?
    assert_includes notification.errors[:message], "can't be blank"
  end

  test "mark_as_read! should set read_at" do
    notification = notifications(:notification_one)
    assert_nil notification.read_at

    notification.mark_as_read!
    assert_not_nil notification.read_at
  end

  test "mark_as_unread! should clear read_at" do
    notification = notifications(:notification_one)
    notification.mark_as_read!
    assert_not_nil notification.read_at

    notification.mark_as_unread!
    assert_nil notification.read_at
  end
end
