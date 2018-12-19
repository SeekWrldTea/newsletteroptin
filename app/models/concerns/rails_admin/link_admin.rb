module RailsAdmin::LinkAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      parent Menu
      navigation_label 'Lien'
      navigation_icon 'fa fa-link'
      label_plural 'Liens'

      edit do
        field :title do
          required true
        end
        field :image, :carrierwave do
          required false
          thumb_method :link_thumb
          help '50px X 50px'
        end
        field :url do
          required true
        end
        field :domain do
          required true
          inline_add false
          inline_edit false
        end
      end

      show do
        field :title
        field :image, :carrierwave do
          thumb_method :link_thumb
        end
        field :url
        field :domain
      end

      list do
        field :image, :carrierwave do
          thumb_method :link_thumb
        end
        field :title
        field :domain
        field :url
        exclude_fields :created_at, :updated_at, :menu_associations, :pages, :menus
      end

    end
  end
end