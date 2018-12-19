# == Schema Information
#
# Table name: forms
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  phone      :string           not null
#  message    :text             not null
#  domain_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_forms_on_domain_id  (domain_id)
#

require 'test_helper'

class FormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
