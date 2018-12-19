module RailsAdminMenuBuilder
  class Engine < ::Rails::Engine
    initializer "RailsAdminMenuBuilder precompile hook", group: :all do |app|
      app.config.assets.precompile += %w(
        rails_admin/react.min.js
        rails_admin/react-dom.min.js
        rails_admin/rails_admin_menu_builder.js
        rails_admin/jquery.nestable.js.jsx
        rails_admin/pubsub.js
        rails_admin/app.js
        rails_admin/rails_admin_menu_builder.scss
      )
    end
  end
end
