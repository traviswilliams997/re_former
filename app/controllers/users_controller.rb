class UsersController < ApplicationController
    def show 
        @user = User.find(params[:id])
    end
    def new 
        @user =User.new
    end

    def create 
  #      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
       @user = User.new(allowed_user_params)

        if @user.save
          redirect_to new_user_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit 
        @user = User.find(params[:id])

    end

    def update
        @user = User.find(params[:id])
    
        if @user.update(allowed_user_params)
          redirect_to @user
        else
          render :edit, status: :unprocessable_entity
        end
      end
private 
def allowed_user_params
    params.require(:user).permit(:username,:email,:password)
  end
end
