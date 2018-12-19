module RailsAdmin::AgencyAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Agence'
      navigation_icon 'fa fa-map-marker'
      label_plural 'Agences'
      weight -1

      edit do
        field :title do
          required true
        end
        field :body, :froala do
          config_options do
            {
              imageUploadURL: '/froala_upload',
              imageUploadParam: 'file',
              imageUploadParams: {
                   type: 'image',
                   model: 'content',
              },
              fileUploadURL: '/froala_upload',
              fileUploadParam: 'file',
              fileUploadParams: {
                   type: 'file',
                   model: 'content',
              },
              imageManagerLoadMethod: 'POST',
              imageManagerLoadURL: '/froala_manage',
              imageManagerLoadParams: {
                   model: 'content',
                   format: 'json'
              }
            }
          end
        end
        field :address
        field :latitude, :map do
          map_label 'Carte'
          map_height 300
          google_api_key 'AIzaSyCLn8pgIREdmRERGKumgwURhH9F6t3penY'
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
        field :body
        field :address
      end

      list do
        field :title
        exclude_fields :created_at, :updated_at, :body, :address
      end
    end
  end
end
