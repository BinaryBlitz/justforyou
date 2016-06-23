class Admin::ExportsController < Admin::AdminController
  before_action :set_export, only: [:kitchen, :courier, :manager]

  def kitchen
    Export.new(@deliveries).kitchen
    send_file("kitchen.csv")
  end

  def courier
    Export.new(@deliveries).courier
    send_file("courier.csv")
  end

  def manager
    Export.new(@deliveries).manager
    send_file("manager.csv")
  end

  private

  def set_export
    respond_to do |format|
      format.csv do
        @deliveries = Delivery.all
      end
    end
  end
end
