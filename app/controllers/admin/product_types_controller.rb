class Admin::ProductTypesController < Admin::AdminController
  before_action :set_product_type, only: [:edit, :update, :destroy]

  def index
    @product_types = ProductType.all.page(params[:page])
  end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new(product_type_params)

    if @product_type.save
      redirect_to admin_product_types_path, notice: 'Тип продукта успешно создан.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_type.update(product_type_params)
      redirect_to admin_product_types_path, notice: 'Тип продукта успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @product_type.destroy
    redirect_to admin_product_types_path, notice: 'Тип продукта успешно удален.'
  end

  private

  def set_product_type
    @product_type = ProductType.find(params[:id])
  end

  def product_type_params
    params.require(:product_type).permit(:name)
  end
end
