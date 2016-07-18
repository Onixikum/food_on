module OrdersHelper # :nodoc:
  def order_info
    @user = @order.user
    @company = @order.company
    dish_info
    total_amount
  end

  def dish_info
    @main_course = Product.find(@order.dish1_id)
    @additional_food = Product.find(@order.dish2_id)
    @beverages = Product.find(@order.dish3_id)
  end

  def list_orders_today
    @array_price = []
    @array_users = []
    @array_company = []
    @orders.each do |order|
      @order = order
      order_info
      array_email
      array_price
      array_company
    end
  end

  def list_orders_user
    @array_company = []
    @array_price = []
    @orders.each do |order|
      @order = order
      @company_name = order.company.name
      dish_info
      array_company
      total_amount
      array_price
    end
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
    @array_company.push(@company_name)
  end

  def total_price
    @total_price = 0
    @array_price.each do |price|
      @total_price += price
    end
  end

  def correct_order
    if @order.dish1_id.nil? || @order.dish2_id.nil? || @order.dish3_id.nil?
      flash[:error] = 'Choose one dish from each item!'
      redirect_to root_path
    else
      current_user
      order_info
      order_save
    end
  end

  def order_save
    if @order.save
      flash.now[:success] = 'Order executed!'
    else
      flash[:error] = 'Enter a shipping address!'
      redirect_to root_path
    end
  end

  def company_fix
    @company_id = params[:company_id]
  end

  def menu
    day_or_week
    @main_course = Product.where(food_type: 1,
                                 company_id: @company_id,
                                 created_at: @starting_date..@the_deadline)
    @additional_food = Product.where(food_type: 2,
                                     company_id: @company_id,
                                     created_at: @starting_date..@the_deadline)
    @beverages = Product.where(food_type: 3,
                               company_id: @company_id,
                               created_at: @starting_date..@the_deadline)
  end

  def day_or_week
    @the_deadline = Time.now.midnight + 1.day
    type = params[:menu_type]
    @starting_date = Time.now.midnight if type == 'day'
    @starting_date = (Time.now.midnight - 1.week) if type == 'week'
  end

  def correct_menu
    if params[:company_id].nil? || params[:menu_type].nil?
      flash[:error] = 'Select company and menu!'
      redirect_to root_path
    end
  end
end
