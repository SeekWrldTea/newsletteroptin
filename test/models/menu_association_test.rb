# == Schema Information
#
# Table name: menu_associations
#
#  id         :integer          not null, primary key
#  menu_id    :integer
#  page_id    :integer
#  link_id    :integer
#  ancestry   :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_menu_associations_on_ancestry  (ancestry)
#  index_menu_associations_on_link_id   (link_id)
#  index_menu_associations_on_menu_id   (menu_id)
#  index_menu_associations_on_page_id   (page_id)
#

require 'test_helper'

class MenuAssociationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
