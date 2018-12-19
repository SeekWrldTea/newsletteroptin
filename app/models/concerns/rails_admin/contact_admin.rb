module RailsAdmin::ContactAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Contact'
      navigation_icon 'fa fa-envelope'
      label_plural 'Contacts'

      edit do
      end

      show do
        field :name
        field :email
        field :phone
        field :message
        field :domain_id
        field :code_form
        field :created_at
      end

      list do
        field :name
        field :email
        field :phone
        field :created_at do
          strftime_format '%d/%m/%Y à %H:%M:%S'
        end
        exclude_fields :created_at, :updated_at, :message, :domain_id, :code_form, :main_lots, :second_lots, :energy, :elevator, :people, :syndical, :assembly_date, :postal_code, :city, :sort, :area, :rooms, :state, :other_lots, :property
      end

    end
  end
end
