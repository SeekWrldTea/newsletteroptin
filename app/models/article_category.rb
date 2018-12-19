# == Schema Information
#
# Table name: article_categories
#
#  id          :integer          not null, primary key
#  article_id  :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_article_categories_on_article_id   (article_id)
#  index_article_categories_on_category_id  (category_id)
#

class ArticleCategory < ApplicationRecord
  include RailsAdmin::ArticleCategoryAdmin
  belongs_to :article
  belongs_to :category
end
