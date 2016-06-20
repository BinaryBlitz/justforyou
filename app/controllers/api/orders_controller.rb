class API::OrdersController < API::APIController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      render :show, status: :created
    else
      render json: @order.errors, status: 422
    end
  end

  def update
    if @order.update(order_params)
      head :ok
    else
      render json: @order.errors, status: 422
    end
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params
      .require(:order)
      .permit(
        :comment, :phone_number, :use_balance,
        line_items_attributes: [
          :order_id, :program_id, :number_of_days
        ]
      )
  end
end
