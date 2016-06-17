class API::PurchasesController < API::APIController
  def index
    @purchases = current_user.purchases
  end
end
