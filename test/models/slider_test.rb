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

require 'test_helper'

class SliderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
