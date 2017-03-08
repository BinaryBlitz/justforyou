class Admin::OrdersController < Admin::AdminController
  def index
    @orders = Order.paid.order(created_at: :desc).search(*date_params).page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def date_params
    to = params[:to].present? ? params[:to].to_date : Date.today
    from = params[:from].present? ? params[:from].to_date : Order.paid.first.try(:created_at)
    [from, to]
  end
end
