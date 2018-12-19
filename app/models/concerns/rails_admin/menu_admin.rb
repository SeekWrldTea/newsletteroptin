module RailsAdmin::MenuAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Menu'
      navigation_icon 'fa fa-list-ol'
      label_plural 'Menus'
      weight -2

      edit do
        exclude_fields :created_at, :updated_at, :menu_associations
      end

      show do
      end

      list do
        exclude_fields :created_at, :updated_at, :pages, :links, :menu_associations
      end
    end
  end
end