# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
#

class Category < ApplicationRecord
  include RailsAdmin::CategoryAdmin
  extend FriendlyId
  has_many :articles

  default_scope { order(title: :asc) }

  friendly_id :title, :use => :slugged

  validates_presence_of :title
end
