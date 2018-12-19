# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Menu < ApplicationRecord
  include RailsAdmin::MenuAdmin
  has_many :menu_associations, dependent: :destroy
  has_many :pages, through: :menu_associations
  has_many :links, through: :menu_associations, dependent: :destroy

  validates_presence_of :code
  validates_uniqueness_of :code
end
