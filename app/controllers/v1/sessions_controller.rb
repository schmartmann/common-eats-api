module V1
    class SessionsController < ApplicationController
        before_action :skip_authorization, :assign_session_attributes, only: :create

        def index
            @sessions = Session.all
            render json: @sessions, each_serializer: V1::SessionSerializer
        end
      

        def create
            if Current.session.save
                render json: Current.session, serializer: V1::SessionSerializer
            else
                render json: Current.session.errors, status: :unprocessable_entity
            end
        end

        def show
            render json: @session, serializer: V1::SessionSerializer
        end

        def destroy
            @session.destroy!
            head :no_content
        end     
        
        private

        def assign_session_attributes
            Current.session.assign_attributes(permitted_attributes(Session))
            Current.session.user_agent = request.headers['User-Agent']
        end
    
        def authentication_strategy
            if action_name == 'create'
                ::Authentication::PasswordStrategy.new(request)
            else
                super
            end
        end    
    end
end