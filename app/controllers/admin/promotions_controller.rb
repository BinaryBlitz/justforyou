class Admin::PromotionsController < Admin::AdminController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]

  def index
    @promotions = Promotion.all.page(params[:page]).per(10)
  end

  def new
    @promotion = Promotion.new
  end

  def show
  end

  def edit
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to admin_promotions_url, notice: 'Акция была успешно создана.'
    else
      render 'new'
    end
  end

  def update
    if @promotion.update(promotion_params)
      redirect_to admin_promotions_url, notice: 'Акция успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @promotion.destroy
    redirect_to admin_promotions_url, notice: 'Акция была успешно удалена.'
  end

  private

  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  def promotion_params
    params.require(:promotion).permit(:name, :description)
  end
end
