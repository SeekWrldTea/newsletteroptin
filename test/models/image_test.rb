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

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
