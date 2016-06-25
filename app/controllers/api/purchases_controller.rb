class API::PurchasesController < API::APIController
  def index
    @purchases = current_user.purchases.with_remaining_deliveries
  end
end
