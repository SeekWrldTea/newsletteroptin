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

class Article < ApplicationRecord
  include RailsAdmin::ArticleAdmin
  extend FriendlyId
  include ActionView::Helpers::TextHelper
  belongs_to :domain
  has_many :article_categories, dependent: :delete_all
  has_many :categories, through: :article_categories

  default_scope { order(published_at: :desc) }
  scope :published, -> { where(:is_published => true) }

  after_initialize :default_values

  validates_presence_of :title, :body, :published_at

  friendly_id :title, :use => :slugged

  def excerpt(nbr = 250)
    return truncate(ActionController::Base.helpers.strip_tags(self.body), length: nbr)
  end

private

  def default_values
    self.published_at ||= Time.new
  end
end
