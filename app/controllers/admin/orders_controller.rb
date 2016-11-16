class Admin::OrdersController < Admin::AdminController
  def index
    @orders = Order.paid.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end
end
