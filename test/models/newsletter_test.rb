# == Schema Information
#
# Table name: newsletters
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  domain_id       :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email_confirmed :boolean          default("f")
#  confirm_token   :string
#
# Indexes
#
#  index_newsletters_on_domain_id  (domain_id)
#

require 'test_helper'

class NewsletterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
