module V1
    class ApplicationController < ActionController::API
        include Pundit
        include ::V1::ApplicationController::ResourceHelpers
    end
end
