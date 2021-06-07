module V1
    class ApplicationController
        module Authentication
            extend ActiveSupport::Concern

            included do 
                before_action :authenticate!
            end

            private

            def authenticate!
                authenticate
                head(:unauthorized) unless Current.user?
            end

            def authenticate
                Current.session = authentication_strategy.authenticate
            end

            def authentication_strategy
                ::Authentication::TokenStrategy.new(request)
            end
        end
    end
end