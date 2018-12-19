require 'rails_admin_menu_builder/engine'

module RailsAdminMenuBuilder
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class MenuBuilder < Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :controller do
          proc do
            def update_tree(nodes, parent_node = nil)
              nodes.each do |position, node|
                model = MenuAssociation.find(node['id'].to_i)
                model.parent = parent_node || nil
                model.position = position.to_i
                model.save!

                update_tree(node['children'], model) if node.key?('children')
              end
            end

            if request.post?
              result = {}

              if params['show'].present?
                if Object.const_defined?('Page')
                  result[:pages] = Page.includes(:menu_associations).where(menu_associations: {id: nil})
                end
                result[:nodes] = @object.menu_associations.roots

              elsif params['update'].present?
                if Object.const_defined?('MenuAssociation')
                  update_tree(params[:nodes])
                  result[:nodes] = @object.menu_associations.roots
                end
              end

              respond_to do |format|
                format.json { render json: {result: result} }
              end

            end
          end
        end

        register_instance_option :visible? do
          if bindings[:abstract_model].present?
            bindings[:abstract_model].model_name == 'Menu'
          elsif bindings[:object_level].present?
            bindings[:object_level].model == Menu
          else
            false
          end
        end

        register_instance_option :object_level do
          true
        end

        register_instance_option :collection? do
          false
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :bulkable? do
          false
        end

        register_instance_option :link_icon do
          'fa fa-rocket'
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :http_methods do
          [:get, :post, :put]
        end
      end
    end
  end
end
