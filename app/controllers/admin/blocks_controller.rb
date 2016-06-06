class Admin::BlocksController < Admin::AdminController
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  def index
    @blocks = Block.all.page(params[:page]).per(10)
  end

  def new
    @block = Block.new
  end

  def show
  end

  def edit
  end

  def create
    @block = Block.new(block_params)
    if @block.save
      redirect_to admin_blocks_url, notice: 'Блок был успешно создан.'
    else
      redirect_to admin_blocks_url
    end
  end

  def update
    if @block.update(block_params)
      redirect_to admin_blocks_url, notice: 'Блок успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @block.destroy
    redirect_to admin_blocks_url, notice: 'Блок был успешн удален.'
  end

  private

  def set_block
    @block = Block.find(params[:id])
  end

  def block_params
    params.require(:block)
          .permit(:name, :image)
  end
end
