module V1
    class ApplicationController < ActionController::API
        include Pundit
        include ::V1::ApplicationController::ResourceHelpers
        include ::V1::ApplicationController::Authentication
        include ::V1::ApplicationController::Authorization
    end
end
