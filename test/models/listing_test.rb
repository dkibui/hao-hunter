require "test_helper"

class ListingTest < ActiveSupport::TestCase
  test "should not save listing without title" do
    listing = Listing.new
    assert_not listing.save
  end
end
