class Admin::ProgramsController < Admin::AdminController
  before_action :find_program, only: [:show, :edit, :update, :destroy]
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
      render :index
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
  end

  private

  def find_program
    @program = Program.find(params[:id])    
  end

  def program_params
    params.require(:program)
          .permit(:name, :description, :duration,
                  :first_price, :second_price, :preview_img)
  end
end
