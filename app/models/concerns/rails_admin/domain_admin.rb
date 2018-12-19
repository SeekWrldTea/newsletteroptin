module RailsAdmin::DomainAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      parent Content
      navigation_label 'Domaine'
      navigation_icon 'fa fa-institution'
      label_plural 'Domaines'

      edit do
        field :title
        field :code
      end

      show do
      end

      list do
        exclude_fields :created_at, :updated_at, :menu_associations, :agencies
      end

    end
  end
end