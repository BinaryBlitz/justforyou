class API::UsersController < API::APIController
  skip_before_action :restrict_access!, only: [:create]
  before_action :set_user, only: [:show, :update]

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render status: :created
    else
      render json: @user.errors, status: 422
    end
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
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :device_token)
  end
end
