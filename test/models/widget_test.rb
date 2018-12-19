# == Schema Information
#
# Table name: widgets
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  subtitle   :string           not null
#  icon       :string           not null
#  url_text   :string           not null
#  url        :string           not null
#  domain_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_widgets_on_domain_id  (domain_id)
#

require 'test_helper'

class WidgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
