module OrdersHelper
  def order_info
    user_id = @order.user_id
    @user = User.find(user_id)
    company_id = @order.company_id
    @company = Company.find(company_id)
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

  def array_company
    @array_company.push(@company.name)
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

  def company_fix
    @company_id = params[:company_id]
  end

  def menu
    if params[:menu_type] == 'day'
      @starting_date = Time.now.midnight
      @the_deadline = Time.now.midnight + 1.day
    elsif params[:menu_type] == 'week'
      @starting_date = Time.now.midnight - 1.week
      @the_deadline = Time.now.midnight + 1.day
    end
    @main_course = Product.where(food_type: 1, company_id: @company_id, created_at: @starting_date..@the_deadline)
    @additional_food = Product.where(food_type: 2, company_id: @company_id, created_at: @starting_date..@the_deadline)
    @beverages = Product.where(food_type: 3, company_id: @company_id, created_at: @starting_date..@the_deadline)
  end

  def correct_menu
    if params[:company_id] == nil or params[:menu_type] == nil
      flash[:error] = "Select company and menu!"
      redirect_to root_path
    end
  end
end