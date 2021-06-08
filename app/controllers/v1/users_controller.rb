module V1
    class UsersController < ApplicationController
        accessible_only_to :admin, except: :create
        skip_before_action :authenticate!, only: :create
        before_action :authenticate, only: :create

        before_action :find_resources, only: :index
        before_action :find_resource,  only: :show
        before_action :build_resource, only: :create

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
    end
end