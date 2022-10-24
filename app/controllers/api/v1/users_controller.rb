class Api::V1::UsersController < ApplicationController
    class UsersController < ApplicationController
        def index 
            @user = User.all
        end
    
        def show
            @user = User.find(params[:id])
        end
    
        def create 
            @user = User.new(user_params)
    
            if @user.save
                render json: @user, status: :created, data: @user
            else  
                render json: @user.errors, status: :unprocessable_entity
            end 
        end

        def update 
            if @user.update(user_params)
                render json: @user
            else  
                render json: @user.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @user.destroy
        end
    
    
    
        private
    
        def user_params
            params.require(:user).permit(:name)
        end
    
    end
    
end
