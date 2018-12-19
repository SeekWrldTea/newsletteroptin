# == Schema Information
#
# Table name: agencies
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  address    :string           not null
#  latitude   :string           default("48.8589507"), not null
#  longitude  :string           default("2.2775169"), not null
#  position   :integer          default("1"), not null
#  body       :text             not null
#  domain_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_agencies_on_domain_id  (domain_id)
#

require 'test_helper'

class AgencyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
