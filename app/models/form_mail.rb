# == Schema Information
#
# Table name: form_mails
#
#  id         :integer          not null, primary key
#  code_form  :string           not null
#  email      :string           not null
#  domain_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_form_mails_on_domain_id  (domain_id)
#

class FormMail < ApplicationRecord
  include RailsAdmin::FormMailAdmin
  belongs_to :domain

  validates :email,
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
            presence: true
  validates_presence_of :code_form


  def code_forms_enum
    %w(GENERAL NEWSLETTER CONFIEZ-IMMEUBLE CONFIEZ-GESTION-BIEN CONFIEZ-VENTE-BIEN RECRUTEMENT)
  end
end
