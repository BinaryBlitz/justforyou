class Admin::ProgramsController < Admin::AdminController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Program.all.page(params[:page]).per(10)
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
      redirect_to admin_programs_url
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
          .permit(:name, :description, :duration,
                  :primary_price, :secondary_price, :preview_image)
  end
end
