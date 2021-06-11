module V1
    class UsersController < ApplicationController
        accessible_only_to :admin, except: :create
        skip_before_action :authenticate!, only: :create
        before_action :authenticate, only: :create

        before_action :find_resources, only: :index
        before_action :find_resource, only: %i[show update destroy]
        before_action :build_resource, only: :create
        before_action :disallow_nonadmin_admin_creation, only: :create, unless: -> { Current.user&.admin? }

        def index
            render json: @users, each_serializer: V1::UserSerializer
        end

        def show 
            render json: @user, serializer: V1::UserSerializer
        end

        def create
            if @user.save
                render json: @user, serializer: V1::UserSerializer, status: :created
            else
                render json: @user.errors, status: :unprocessable_entity
            end        
        end

        def update
            if @user.update(permitted_attributes(@user))
                render json: @user, serializer: V1::UserSerializer 
            else
                render json: @user.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @user.destroy!
            head :no_content
        end

        private

        def disallow_nonadmin_admin_creation
          @user.admin = false
        end    
    end
end