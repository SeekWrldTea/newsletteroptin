module RailsAdmin::MenuAssociationAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      weight -4
      visible false

      edit do
        exclude_fields :position, :pages, :menus, :menu_association
      end

      show do
      end

      list do
        exclude_fields :ancestry, :position, :pages, :menus, :menu_association
      end
    end
  end
end