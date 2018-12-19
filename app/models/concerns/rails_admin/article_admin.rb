module RailsAdmin::ArticleAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Article'
      navigation_icon 'fa fa-bullhorn'
      label_plural 'Articles'
      weight -2

      edit do
        field :title do
          html_attributes do
            {:maxlength => 80}
          end
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
        field :categories do
          required false
        end
        field :is_published do
          required false
        end
        field :published_at do
          strftime_format do
            '%d-%m-%Y %H:%M:%S'
          end
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
        field :domain
      end

      list do
        field :title
        field :domain
        field :published_at do
          strftime_format '%d/%m/%Y à %H:%M:%S'
        end
        exclude_fields :created_at, :updated_at, :body, :categories
      end
    end
  end
end
