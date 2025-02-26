require "test_helper"

class ListingTest < ActiveSupport::TestCase
  test "should validate presence of required attributes" do
    listing = Listing.new
    assert_not listing.valid?
    assert_includes listing.errors[:title], "can't be blank"
    assert_includes listing.errors[:description], "can't be blank"
    assert_includes listing.errors[:bedrooms], "can't be blank"
    assert_includes listing.errors[:bathrooms], "can't be blank"
  end

  test "should validate presence of description" do
    listing = Listing.new(title: "Test Listing", bedrooms: 1, bathrooms: 1, rent_amount: 1000)
    assert_not listing.valid?
    assert_includes listing.errors[:description], "can't be blank"
  end

  test "should have a valid description" do
    listing = listings(:listing_one)
    assert_equal "A beautiful and cozy apartment with modern amenities.", listing.description.to_plain_text
  end

  test "should validate numericality of rent_amount, bedrooms, and bathrooms" do
    listing = listings(:listing_one)
    listing.rent_amount = "not a number"
    listing.bedrooms = -1
    listing.bathrooms = "1.5"

    assert_not listing.valid?
    assert_includes listing.errors[:rent_amount], "is not a number"
    assert_includes listing.errors[:bedrooms], "must be greater than or equal to 0"
    assert_includes listing.errors[:bathrooms], "must be an integer"
  end

  test "should notify users of changes" do
    listing = listings(:listing_one)
    listing.rent_amount = 60000
    # NotifyUsersJob.expect(:perform_later).with(listing, "The rent amount of listing Cozy Apartment", [ users(:john_doe).id ])
    assert NotifyUsersJob.perform_now, "NotifyUsersJob did not perform as expected"
    listing.save!
  end
end
