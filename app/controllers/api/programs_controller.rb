class API::ProgramsController < API::APIController
  before_action :set_program, only: [:show]
  before_action :set_block, only: [:index]

  def index
    @programs = @block.present? ? @block.programs : Program.all
  end

  def show
  end

  private

  def set_block
    @block = Block.find(params[:block_id]) if params[:block_id].present?
  end

  def set_program
    @program = Program.find(params[:id])
  end
end
