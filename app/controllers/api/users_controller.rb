class Api::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params)
      head :ok
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def find_user
    @user = User.find(params[:id])    
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end
