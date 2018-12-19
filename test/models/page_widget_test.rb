# == Schema Information
#
# Table name: page_widgets
#
#  id         :integer          not null, primary key
#  page_id    :integer          not null
#  widget_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_page_widgets_on_page_id    (page_id)
#  index_page_widgets_on_widget_id  (widget_id)
#

require 'test_helper'

class PageWidgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
