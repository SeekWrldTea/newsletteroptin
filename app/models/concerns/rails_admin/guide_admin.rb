module RailsAdmin::GuideAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      visible false
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
      end
    end
  end
end
