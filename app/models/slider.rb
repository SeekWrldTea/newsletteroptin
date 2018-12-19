# == Schema Information
#
# Table name: sliders
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image      :string           not null
#  position   :integer          default("1"), not null
#  domain_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sliders_on_domain_id  (domain_id)
#

class Slider < ApplicationRecord
  include RailsAdmin::SliderAdmin
  belongs_to :domain
  validates_presence_of :title, :image, :position

  mount_uploader :image, ImageUploader
end
