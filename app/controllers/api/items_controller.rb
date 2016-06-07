class API::ItemsController < API::APIController
  before_action :set_day, only: [:index]

  def index
    @items = @day.items.all
  end

  private

  def set_day
    @day = Day.find(params[:day_id])
  end
end
