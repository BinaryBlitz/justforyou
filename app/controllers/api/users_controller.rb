class API::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

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
      render json: @user.errors, status: 422
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end
