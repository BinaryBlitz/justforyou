class API::ProgramsController < API::APIController
  before_action :set_program, only: [:show]
  before_action :set_block, only: [:index, :update]

  def index
    @programs = @block.programs.all
  end

  def show
  end

  def update
    if @block.programs.update(program_params)
      head :ok
    else
      render json: @program.errors, status: 422
    end
  end

  private

  def set_block
    @block = Block.find(params[:block_id])
  end

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program)
          .permit(:name, :description, :duration,
                  :primary_price, :secondary_price, :preview_img, :block_id)
  end
end
