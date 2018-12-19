# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  image       :string           not null
#  property_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_images_on_property_id  (property_id)
#

class Image < ApplicationRecord
  include RailsAdmin::ImageAdmin
  belongs_to :property
  mount_uploader :image, ImageUploader

  default_scope { order(id: :asc) }
end
