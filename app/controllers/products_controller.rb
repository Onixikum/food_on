class ProductsController < ApplicationController
  before_action :admin_user, only: [:new, :create]

  def index
    @main_course = Product.where(food_type: 1)
    @additional_food = Product.where(food_type: 2)
    @beverages = Product.where(food_type: 3)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Add product!"
      redirect_to products_path
    else
      render 'new'
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :food_type)
    end
end