# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string           not null
#  image      :string
#  domain_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_links_on_domain_id  (domain_id)
#

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
