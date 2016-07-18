class ProductsController < ApplicationController # :nodoc:
  before_action :signed_in_user, only: [:new, :create]
  before_action :admin_user, only: [:new, :create]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Add product!'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :food_type, :company_id)
  end
end
