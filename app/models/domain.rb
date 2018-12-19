# == Schema Information
#
# Table name: domains
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Domain < ApplicationRecord
  include RailsAdmin::DomainAdmin
  validates_presence_of :code, :title
end
