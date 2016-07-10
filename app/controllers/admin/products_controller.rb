class Admin::ProductsController < Admin::AdminController
  before_action :set_product_type, only: [:index, :new, :create]
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.page(params[:page])
  end

  def new
    @product = @product_type.products.build
  end

  def create
    @product = @product_type.products.build(product_params)

    if @product.save
      redirect_to admin_product_type_products_path(@product_type),
                  notice: 'Продукт успешно создан.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_product_type_products_path(@product.product_type),
                  notice: 'Продукт успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_product_type_products_path(@product.product_type),
                notice: 'Продукт успешно удален.'
  end

  private

  def set_product_type
    @product_type = ProductType.find(params[:product_type_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name)
  end
end
