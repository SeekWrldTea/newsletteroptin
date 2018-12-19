# == Schema Information
#
# Table name: widgets
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  subtitle   :string           not null
#  icon       :string           not null
#  url_text   :string           not null
#  url        :string           not null
#  domain_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_widgets_on_domain_id  (domain_id)
#

class Widget < ApplicationRecord
  include RailsAdmin::WidgetAdmin
  belongs_to :domain

  validates :subtitle,
            presence: true,
            length: { minimum: 2, maximum: 80 }
  validates :url_text,
            presence: true,
            length: { minimum: 2, maximum: 80 }
  validates_presence_of :title, :subtitle, :url, :icon, :domain

  attr_accessor :name

  default_scope { order(title: :asc) }

  def name
    if self.id
      self.name = '['+self.domain.title+'] '+self.title
    end
  end

end
