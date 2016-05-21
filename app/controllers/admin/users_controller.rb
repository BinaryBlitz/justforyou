class Admin::UsersController < Admin::AdminController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit 
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url, notice: 'Пользователь успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])    
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end
end