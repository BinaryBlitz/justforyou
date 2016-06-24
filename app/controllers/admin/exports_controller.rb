class Admin::ExportsController < Admin::AdminController
  before_action :set_export, only: [:kitchen, :courier, :manager]

  def kitchen
    Kitchen.new(@deliveries).to_csv
    send_file('kitchen.csv')
  end

  def courier
    Courier.new(@deliveries).to_csv
    send_file('courier.csv')
  end

  def manager
    ExportManager.new(@deliveries).to_csv
    send_file('manager.csv')
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
