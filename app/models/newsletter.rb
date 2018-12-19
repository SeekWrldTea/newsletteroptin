# == Schema Information
#
# Table name: newsletters
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  domain_id       :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email_confirmed :boolean          default("f")
#  confirm_token   :string
#
# Indexes
#
#  index_newsletters_on_domain_id  (domain_id)
#

class Newsletter < ApplicationRecord

	include RailsAdmin::NewsletterAdmin
	before_create :confirmation_token

	belongs_to :domain
		validates :email,
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
            presence: true


  def send_notifications!
    NewsletterMailer.newsletter_notification(self).deliver_now
  end

  def email_activate
  	self.email_confirmed = true 
  	self.confirm_token = nil 
  	save!(:validate => false)
  end 
  
	private 

	def confirmation_token
      if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end 

end
