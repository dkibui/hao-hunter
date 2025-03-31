require "test_helper"

class ListingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @listing = listings(:one)
    @listing.description = "This is a description"
    sign_in @user
  end

  test "should get index" do
    get listings_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_url
    assert_response :success
  end

  # test "should create listing" do
  #   assert_difference("Listing.count") do
  #     post listings_url, params: { listing: { bathrooms: @listing.bathrooms, bedrooms: @listing.bedrooms, latitude: @listing.latitude, longitude: @listing.longitude, rent_amount: @listing.rent_amount, title: "New Listing", user_id: @user.id } }
  #   end

  #   assert_redirected_to listing_url(Listing.last)
  #   assert_equal @user, Listing.last.user
  # end

  test "should show listing" do
    get listing_url(@listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_url(@listing)
    assert_response :success
  end

  # test "should update listing" do
  #   @listing.title = "Updated Title"
  #
  #   patch listing_url(@listing), params: @listing
  #   assert_redirected_to listing_url(@listing)
  #
  #   @listing.reload
  #   assert_equal "Updated Title", @listing.title
  # end

  test "should destroy listing" do
    assert_difference("Listing.count", -1) do
      delete listing_url(@listing)
    end

    assert_redirected_to listings_url
  end

  test "should not create listing with invalid params" do
    assert_no_difference("Listing.count") do
      post listings_url, params: { listing: { title: nil, user_id: @user.id } }
    end

    assert_response :unprocessable_entity
  end

  test "should not update listing with invalid params" do
    patch listing_url(@listing), params: { listing: { title: nil } }
    assert_response :unprocessable_entity
  end

  # test "should update listing with description" do
  #   patch listing_url(@listing), params: { listing: { description: "Updated description" } }
  #   assert_redirected_to listing_url(@listing)
  #   assert_equal "Updated description", @listing.description.body.to_s
  # end
end
