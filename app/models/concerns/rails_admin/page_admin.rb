module RailsAdmin::PageAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Page'
      navigation_icon 'fa fa-book'
      label_plural 'Pages'
      weight -2

      edit do
        field :title
        field :body, :froala do
          config_options do
            {
              imageUploadURL: '/froala_upload',
              imageUploadParam: 'file',
              imageUploadParams: {
                type: 'image',
                model: 'page',
              },
              fileUploadURL: '/froala_upload',
              fileUploadParam: 'file',
              fileUploadParams: {
                type: 'file',
                model: 'page',
              },
              imageManagerLoadMethod: 'POST',
              imageManagerLoadURL: '/froala_manage',
              imageManagerLoadParams: {
                model: 'page',
                format: 'json',
              },
              imageManagerDeleteMethod: 'DELETE',
              imageManagerDeleteURL: '/froala_delete',
              imageManagerDeleteParams: {
                model: 'page',
                format: 'json',
              },
            }
          end
        end
        field :seo do
          required true
          active true
        end
        field :widgets
        field :guides do
          active true
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
        exclude_fields :created_at, :updated_at, :seo, :body
      end
    end
  end
end
