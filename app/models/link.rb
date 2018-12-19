# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string           not null
#  image      :string
#  domain_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_links_on_domain_id  (domain_id)
#

class Link < ApplicationRecord
  include RailsAdmin::LinkAdmin
  belongs_to :domain
  has_many :menu_associations, dependent: :nullify
  has_many :menus, through: :menu_associations, dependent: :nullify

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 40 }
  validates_presence_of :url

  mount_uploader :image, ImageUploader
end
