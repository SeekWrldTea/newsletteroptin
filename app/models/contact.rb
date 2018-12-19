# == Schema Information
#
# Table name: contacts
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  email          :string           not null
#  phone          :string           not null
#  message        :text             not null
#  domain_id      :integer          not null
#  code_form      :string
#  main_lots      :string
#  second_lots    :string
#  energy         :string
#  elevator       :string
#  people         :string
#  syndical       :string
#  assembly_date  :string
#  postal_code    :string
#  city           :string
#  sort           :string
#  area           :string
#  rooms          :string
#  state          :string
#  other_lots     :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  property_id    :integer
#  job            :string
#  address        :string
#  recommendation :string
#  cv             :string
#  cover_letter   :string
#
# Indexes
#
#  index_contacts_on_domain_id    (domain_id)
#  index_contacts_on_property_id  (property_id)
#

class Contact < ApplicationRecord
  include RailsAdmin::ContactAdmin
  belongs_to :domain
  belongs_to :property

  validates :email,
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
            presence: true
  validates_presence_of :name, :phone, :message, :domain

  serialize :other_lots, Array

  mount_uploader :cv, AttachmentUploader
  mount_uploader :cover_letter, AttachmentUploader

  def send_notifications!
    ContactMailer.contact_notification(self).deliver_now
  end



end
