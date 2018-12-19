module RailsAdmin::FormMailAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      parent Content
      navigation_label 'Email de notification formulaire'
      navigation_icon 'fa fa-server'
      label_plural 'Emails de notification formulaire'

      edit do
        field :code_form, :enum do
          enum_method do
            :code_forms_enum
          end
          required true
        end
        field :email do
          required true
        end
        field :domain do
          required true
          inline_add false
          inline_edit false
        end
      end

      show do
        field :code_form
        field :email
        field :domain
      end

      list do
        field :code_form
        field :email
        field :domain
        exclude_fields :created_at, :updated_at
      end
    end
  end
end
