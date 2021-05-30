module V1
    class UsersController < ApplicationController
        before_action :build_resource, only: :create

        def index
          @users = User.all

          render json: @users, each_serializer: V1::UserSerializer
        end

        def create
            if @user.save
                render json: @user, serializer: V1::UserSerializer, status: :created
              else
                render json: @user.errors, status: :unprocessable_entity
              end        
        end
    end
end