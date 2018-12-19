module RailsAdmin::CategoryAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      parent Article
      navigation_label 'Catégorie'
      navigation_icon 'fa fa-tags'
      label_plural 'Catégories'

      edit do
        field :title do
          required true
        end
      end

      show do
        field :title
      end

      list do
        field :title
        exclude_fields :created_at, :updated_at, :articles
      end
    end
  end
end
