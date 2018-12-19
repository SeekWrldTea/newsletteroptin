class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :link_thumb, if: :link? do
    process resize_to_fill: [50, 50]
  end

  version :slider_thumb, if: :slider? do
    process resize_to_fill: [1200, 420]
  end

  version :image_thumb, if: :image? do
    process resize_to_fill: [500, 500]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    /image\//
  end

protected

  def link?(_picture)
    model.is_a?(Link)
  end

  def slider?(_picture)
    model.is_a?(Slider)
  end

  def image?(_picture)
    model.is_a?(Image)
  end
end
