class HeroImagesController < ApplicationController
  def new
    @hero_image = HeroImage.new
  end

  def create
    @hero_image = HeroImage.new(hero_image_params)
    if @hero_image.save
      redirect_to @hero_image, notice: "Hero image uploaded successfully!"
    else
      render :new
    end
  end

  private

  def hero_image_params
    params.require(:hero_image).permit(:image)
  end
end
