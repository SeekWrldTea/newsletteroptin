module RailsAdmin::SliderAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      parent Content
      navigation_label 'Slider Accueil'
      navigation_icon 'fa fa-image'

      edit do
        field :title do
          required true
        end
        field :image, :carrierwave do
          required true
          thumb_method :slider_thumb
          help '1200px X 420px - Obligatoire'
        end
        field :position do
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
        field :image
        field :domain
        field :position
      end

      list do
        field :image, :carrierwave do
          thumb_method :slider_thumb
        end
        field :title
        field :domain
        field :position
        exclude_fields :created_at, :updated_at
      end

    end
  end
end