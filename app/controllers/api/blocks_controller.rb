class API::BlocksController < API::APIController
  def index
    @blocks = Block.all
  end

  def show
    @block = Block.find(params[:id])
  end
end
