class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]

  def index
    @hero_images = HeroImage.all
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.expect(listing: [ :title, :description, :rent_amount, :bedrooms,
                            :bathrooms, :latitude, :longitude, images: [] ])
  end
end
