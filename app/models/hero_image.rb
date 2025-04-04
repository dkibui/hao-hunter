class HeroImage < ApplicationRecord
  include HeroImageUploader::Attachment(:image)
end
