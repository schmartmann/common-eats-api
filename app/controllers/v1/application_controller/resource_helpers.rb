module V1
    class ApplicationController
        module ResourceHelpers
            extend ActiveSupport::Concern

            private

            def find_resources
                self.resource = policy_scope(resource_class)
            end
    
            def build_resource
                self.resource = authorize(resource_class).new(permitted_attributes(resource_class))
            end
    
            def find_resource
                self.resource = authorize resource_class.find(params[:id])
            end
    
            def filter_resources
                self.resource = apply_scopes(resource)
            end
    
            def sort_resources
                return unless params[:sort]
                self.resource = resource.order(params[:sort] => params[:sort_direction] || :asc)
            end
    
            def resource
                instance_variable_get(resource_variable_name)
            end
    
            def resource=(value)
                instance_variable_set(resource_variable_name, value)
            end
    
            def resource_variable_name
                if action_name == 'index'
                    :"@#{controller_name}"
                else
                    :"@#{controller_name.singularize}"
                end
            end
    
            def resource_class
                @resource_class ||= resource_class_name.constantize
            end
    
            def resource_class_name
                @resource_class_name ||= controller_name.classify
            end      
        end
    end
end