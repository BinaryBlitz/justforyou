class Admin::ExportsController < Admin::AdminController
  before_action :set_date, only: [:create]
  before_action :set_export, only: [:create]

  def new
  end

  def create
    send_data(@export.to_csv, filename: @export.filename)
  end

  private

  def set_date
    @date = params[:date].present? ? params[:date].to_date : Date.today
  end

  def set_export
    @export = if params[:kitchen].present?
                KitchenExport.new(@date)
              elsif params[:courier].present?
                CourierExport.new(@date)
              elsif params[:manager].present?
                ManagerExport.new(@date)
              end
  end
end
