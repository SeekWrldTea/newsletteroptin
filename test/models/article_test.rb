# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  body         :text             not null
#  published_at :datetime         not null
#  is_published :boolean          default("f"), not null
#  domain_id    :integer          not null
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_articles_on_domain_id  (domain_id)
#  index_articles_on_slug       (slug) UNIQUE
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
