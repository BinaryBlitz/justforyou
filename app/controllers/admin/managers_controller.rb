class Admin::ManagersController < Admin::AdminController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]

  def index
    authorize Manager
    @managers = Manager.all.page(params[:page]).per(10)
  end

  def new
    authorize Manager
    @manager = Manager.new
  end

  def show
    authorize @manager
  end

  def edit
    authorize @manager
  end

  def create
    authorize Manager
    @manager = Manager.new(manager_params)
    if @manager.save
      redirect_to admin_managers_url, notice: 'Аккаунт менеджера успешно создан.'
    else
      render 'new'
    end
  end

  def update
    authorize @manager
    if @manager.update(manager_params)
      redirect_to admin_managers_url, notice: 'Аккаунт менеджера успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    authorize @manager
    @manager.destroy
    redirect_to admin_managers_url, notice: 'Аккаунт менеджера успешно удален.'
  end

  private

  def set_manager
    @manager = Manager.find(params[:id])
  end

  def manager_params
    params.require(:manager).permit(:email, :password)
  end
end
