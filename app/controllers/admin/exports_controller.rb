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
    @export = case params[:commit]
              when 'Для кухни' then KitchenExport.new(@date)
              when 'Для курьеров' then CourierExport.new(@date)
              when 'Для менеджеров' then ManagerExport.new(@date)
              end
  end
end
