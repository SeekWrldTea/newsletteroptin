# == Schema Information
#
# Table name: form_mails
#
#  id         :integer          not null, primary key
#  code_form  :string           not null
#  email      :string           not null
#  domain_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_form_mails_on_domain_id  (domain_id)
#

require 'test_helper'

class FormMailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
