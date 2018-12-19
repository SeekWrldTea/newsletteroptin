# == Schema Information
#
# Table name: domains
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DomainTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
