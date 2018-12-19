module RailsAdmin::WidgetAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Widget'
      navigation_icon 'fa fa-cubes'
      label_plural 'Widgets'

      edit do
        field :title do
          required true
        end
        field :subtitle do
          required true
        end
        field :icon do
          required true
        end
        field :url_text do
          required true
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
        field :subtitle
        field :icon
        field :url_text
        field :url
        field :domain
      end

      list do
        field :title
        field :domain
        exclude_fields :created_at, :updated_at, :icon, :url_text, :url
      end

    end
  end
end