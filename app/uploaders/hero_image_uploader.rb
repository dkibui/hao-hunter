require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads")
}

Shrine.plugin :activerecord   # If using ActiveRecord
Shrine.plugin :cached_attachment_data # Retain file input on validation errors
Shrine.plugin :restore_cached_data # Restore cached file after form redisplay

class HeroImageUploader < Shrine
  plugin :validation_helpers
  plugin :determine_mime_type
  plugin :store_dimensions
  plugin :processing
  plugin :versions
  plugin :delete_raw # Automatically delete temporary files

  Attacher.validate do
    validate_max_size 5 * 1024 * 1024, message: "is too large (max 5MB)"
    validate_mime_type_inclusion %w[image/jpeg image/png image/webp]
  end

  process(:store) do |io, context|
    original = io.download
    pipeline = ImageProcessing::MiniMagick

    {
      original: io,
      large: pipeline.source(original).resize_to_limit!(1200, 600),
      thumb: pipeline.source(original).resize_to_limit!(300, 150)
    }
  end
end
