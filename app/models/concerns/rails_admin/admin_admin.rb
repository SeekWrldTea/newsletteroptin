module RailsAdmin::AdminAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Admins'
      navigation_icon 'fa fa-user-secret'
      label_plural 'Admins'
      weight 3

      edit do
        field :email
        field :password
        field :reset_password_sent_at
        field :remember_created_at
        field :current_sign_in_at
        field :last_sign_in_at
        field :current_sign_in_ip
        field :last_sign_in_ip
      end

      show do
      end

      list do
        field :email
        exclude_fields :created_at, :updated_at, :remember_created_at, :current_sign_in_at, :last_sign_in_at, :reset_password_sent_at, :current_sign_in_ip, :last_sign_in_ip, :sign_in_count
      end
    end
  end
end
