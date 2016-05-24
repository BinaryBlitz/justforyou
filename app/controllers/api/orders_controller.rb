class API::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = User.first.orders
  end

  def show
  end

  def create
    @order = User.first.orders.build(order_params)
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
    params.require(:order).permit(:address, :comment, :phone_number)
  end
end
