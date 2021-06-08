
module V1
    class ApplicationController
        module Authorization
            extend ActiveSupport::Concern
            include Pundit

            included do
                after_action :verify_policy_scoped, only: :index
                after_action :verify_authorized, except: :index
            end

            module ClassMethods
                private

                def accessible_only_to(*roles)
                    options = roles.extract_options!

                    before_action(options) do
                        head :forbidden unless roles.any? { |role| Current.user.role?(role) }
                    end
                end
            end

            private

            def pundit_user
                Current.user
            end
      
            def pundit_params_for(_record)
                params
            end      
        end
    end
end