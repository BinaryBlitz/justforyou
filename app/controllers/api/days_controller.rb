class API::DaysController < API::APIController
  def show
    @day = Day.find(params[:id])
  end
end
