class API::DeliveryInvoicesController < API::APIController
  def create
    @delivery_invoice = current_user.delivery_invoices.build

    if @delivery_invoice.save
      render :show, status: :created
    else
      render json: @delivery_invoice.errors, status: 422
    end
  end
end
