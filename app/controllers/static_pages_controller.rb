class StaticPagesController < ApplicationController

  def home
    current_user
    @order = Order.new
    @main_course = Product.where(food_type: 1)
    @additional_food = Product.where(food_type: 2)
    @beverages = Product.where(food_type: 3)
  end

  def help
  	
  end
  
end
