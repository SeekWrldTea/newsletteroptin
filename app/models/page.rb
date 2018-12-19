# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text             not null
#  slug       :string           not null
#  seo_id     :integer
#  domain_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pages_on_domain_id  (domain_id)
#  index_pages_on_seo_id     (seo_id)
#

class Page < ApplicationRecord
  include RailsAdmin::PageAdmin
  extend FriendlyId
  belongs_to :seo
  belongs_to :domain
  has_many :guides, dependent: :destroy
  has_many :menu_associations, dependent: :nullify
  has_many :menus, through: :menu_associations
  has_many :page_widgets, dependent: :delete_all
  has_many :widgets, through: :page_widgets

  accepts_nested_attributes_for :guides, allow_destroy: true
  accepts_nested_attributes_for :seo, allow_destroy: true

  friendly_id :slug_candidates, use: :history

  validates_presence_of :title, :body

  default_scope { order(title: :asc) }

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
        :title,
        [:title, :domain_id]
    ]
  end
end
