class Admin::BalancesController < Admin::AdminController
  before_action :set_balance, only: [:edit, :update]

  def index
    @balance = Balance.first
  end

  def edit
  end

  def update
    if @balance.update(balance_params)
      redirect_to admin_balances_url, notice: 'Настройки бонусов успешно обновлены.'
    else
      render :edit
    end
  end

  private

  def set_balance
    @balance = Balance.find(params[:id])
  end

  def balance_params
    params.require(:balance)
          .permit(
            :lower_days_regular_threshold, :upper_days_regular_threshold,
            :lower_percentage_regular_threshold, :upper_percentage_regular_threshold,
            :lower_days_periodic_threshold, :balance_period, :periodic_balance_sum
          )
  end
end
