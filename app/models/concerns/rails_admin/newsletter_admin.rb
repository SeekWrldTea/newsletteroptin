module RailsAdmin::NewsletterAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      parent Contact
      navigation_label 'Newsletter'
      navigation_icon 'fa fa-envelope-o'
      label_plural 'Newsletter'

      edit do
        field :email do
          required true
        end
        field :created_at do
          strftime_format '%d/%m/%Y à %H:%M:%S'
          required true
        end
      end

      show do
        field :email
        field :created_at do
          strftime_format '%d/%m/%Y à %H:%M:%S'
        end
      end

      list do
        field :email
        field :created_at do
          strftime_format '%d/%m/%Y à %H:%M:%S'
        end
        exclude_fields :updated_at
      end

    end
  end
end