class Admin::ExportsController < Admin::AdminController
  before_action :set_deliveries

  def kitchen
    @export = KitchenExport.new(@deliveries)
    send_data(@export.to_csv, filename: @export.filename)
  end

  def courier
    @export = CourierExport.new(@deliveries)
    send_data(@export.to_csv, filename: @export.filename)
  end

  def manager
    @export = ManagerExport.new(@deliveries)
    send_data(@export.to_csv, filename: @export.filename)
  end

  private

  def set_deliveries
    @deliveries = Delivery.valid
  end
end
