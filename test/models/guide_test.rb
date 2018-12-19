# == Schema Information
#
# Table name: guides
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text             not null
#  page_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_guides_on_page_id  (page_id)
#

require 'test_helper'

class GuideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
