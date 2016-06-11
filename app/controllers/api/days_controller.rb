class API::DaysController < API::APIController
  before_action :set_program, only: [:index]

  def index
    @days = @program.days.includes(:items)
  end

  def show
    @day = Day.find(params[:id])
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end
end
