class Admin::DaysController < Admin::AdminController
  before_action :set_program, only: [:index, :new, :create]
  before_action :set_day, only: [:show, :edit, :update]

  def index
    @days = @program.days
  end

  def show
  end

  def new
    @day = @program.days.build
  end

  def create
    @day = @program.days.build(day_params)

    if @day.save
      redirect_to [:admin, @day], notice: 'День успешно создан.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @day.update(day_params)
      redirect_to [:admin, @day], notice: 'День успешно обновлен.'
    else
      render :edit
    end
  end

  private

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_day
    @day = Day.find(params[:id])
  end

  def day_params
    params.require(:day)
      .permit(
        :position, items_attributes: [
          :id, :content, :weight, :calories, :starts_at, :ends_at, :_destroy
        ]
      )
  end
end
