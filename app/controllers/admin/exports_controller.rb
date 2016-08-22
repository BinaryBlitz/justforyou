class Admin::ExportsController < Admin::AdminController
  before_action :set_deliveries

  def index
  end

  def kitchen
    @export = KitchenExport.new(@deliveries, @date)
    send_data(@export.to_csv, filename: @export.filename)
  end

  def courier
    @export = CourierExport.new(@deliveries, @date)
    send_data(@export.to_csv, filename: @export.filename)
  end

  def manager
    @export = ManagerExport.new(@deliveries, @date)
    send_data(@export.to_csv, filename: @export.filename)
  end

  def download
    if params[:kitchen]
      kitchen
    elsif params[:courier]
      courier
    elsif params[:manager]
      manager
    else
      redirect_to action: :index
    end
  end

  private

  def set_deliveries
    @date = params[:date].present? ? params[:date].to_date : Date.today
    @deliveries = Delivery.on_date(@date).valid
  end
end
