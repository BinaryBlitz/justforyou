class API::ProgramsController < API::APIController
  before_action :set_program, only: [:show]
  before_action :set_block, only: [:index]

  def index
    @programs = @block.programs
  end

  def show
  end

  private

  def set_block
    @block = Block.find(params[:block_id])
  end

  def set_program
    @program = Program.find(params[:id])
  end
end
