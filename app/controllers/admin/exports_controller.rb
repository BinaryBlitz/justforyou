class Admin::ExportsController < Admin::AdminController
  def kitchen
    @export = KitchenExport.new(Delivery.all)
    send_data(@export.to_csv, filename: @export.filename)
  end

  def courier
    @export = CourierExport.new(Delivery.all)
    send_data(@export.to_csv, filename: @export.filename)
  end

  def manager
    @export = ManagerExport.new(Delivery.all)
    send_data(@export.to_csv, filename: @export.filename)
  end
end
