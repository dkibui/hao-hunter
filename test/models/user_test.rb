require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should create user with valid attributes" do
    user = users(:john_doe)
    assert user.valid?
  end

  test "should have many notifications" do
    user = users(:john_doe)
    assert_equal 1, user.notifications.count
  end

  test "should have many listings through notifications" do
    user = users(:john_doe)
    assert_equal 1, user.listings.count
  end
end
