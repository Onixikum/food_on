module OrdersHelper
  def order_info
    user_id = @order.user_id
    @user = User.find(user_id)
    dish1_id = @order.dish1_id
    @main_course = Product.find(dish1_id)
    dish2_id = @order.dish2_id
    @additional_food = Product.find(dish2_id)
    dish3_id = @order.dish3_id
    @beverages = Product.find(dish3_id)
    total_amount
  end

  def total_amount
    @total = @main_course.price + @additional_food.price + @beverages.price
  end

  def array_email
    @array_users.push(@user.email)
  end

  def array_price
    @array_price.push(@total)
  end

  def total_price
    @total_price = 0
    @array_price.each do |price|
      @total_price += price
    end
  end

  def correct_order
    if @order.dish1_id == nil or @order.dish2_id == nil or @order.dish3_id == nil
      flash[:error] = "Choose one dish from each item!"
      redirect_to root_path
    else
      current_user
      order_info
      if @order.save
        flash.now[:success] = "Order executed!"
      else
        flash[:error] = "Enter a shipping address!"
        redirect_to root_path
      end
    end
  end
end