class Admin::ProgramsController < Admin::AdminController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Program.all.page(params[:page]).per(10)
  end

  def new
    @program = Program.new
    @days = @program.days.build
    @items = @days.items.build
  end

  def show
  end

  def edit
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to admin_programs_url, notice: 'Программа была успешно создана.'
    else
      render 'new'
    end
  end

  def update
    if @program.update(program_params)
      redirect_to admin_programs_url, notice: 'Программа успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @program.destroy
    redirect_to admin_programs_url, notice: 'Программа была успешно удалена.'
  end

  private

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program)
          .permit(:name, :description, :threshold, :primary_price,
                  :secondary_price, :preview_image, :block_id, prescription:[],
                  days_attributes:[:id, :position, :_destroy,
                  items_attributes: [:id, :content, :weight, :calories,
                                     :starts_at, :ends_at, :_destroy]])
  end
end
