module OrdersHelper # :nodoc:
  def info_to(order)
    @order = order
    @company = order.company
    @user = order.user
    dish_info
  end

  def summary_of_the(order)
    @order = order
    @company = order.company
    dish_info
  end

  def dish_info
    @main_course = Product.find(@order.dish1_id)
    @additional_food = Product.find(@order.dish2_id)
    @beverages = Product.find(@order.dish3_id)
    total_amount
  end

  def total_amount
    @total = @main_course.price + @additional_food.price + @beverages.price
  end

  def company_fix
    company_id = params[:company_id]
    @company = Company.find(company_id)
  end

  def correct_menu
    if params[:company_id].nil? || params[:menu_type].nil?
      flash[:error] = 'Select company and menu!'
      redirect_to companies_path
    end
  end

  def day_or_week
    type = params[:menu_type]
    @max = Time.now.midnight + 1.day
    @min = Time.now.midnight if type == 'day'
    @min = (Time.now.midnight - 1.week) if type == 'week'
  end

  def menu
    day_or_week
    @main_course = @company.products.where(food_type: 1,
                                           created_at: @min..@max)
    @additional_food = @company.products.where(food_type: 2,
                                               created_at: @min..@max)
    @beverages = @company.products.where(food_type: 3,
                                         created_at: @min..@max)
  end
end
