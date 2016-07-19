class OrdersController < ApplicationController # :nodoc:
  before_action :signed_in_user, only: [:index, :show, :new, :create]
  before_action :correct_user,   only: [:new, :create]
  before_action :admin_user,     only: :index

  def index
    @orders = Order.where(created_at:
                          Time.now.midnight..(Time.now.midnight + 1.day))
  end

  def show
    order = Order.find(params[:id])
    info_to(order)
  end

  def new
    company_fix
    correct_menu
    @order = Order.new
    menu
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash.now[:success] = 'Order executed!'
      info_to(@order)
    else
      flash[:error] = 'Enter a shipping address!'
      redirect_to companies_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:dish1_id, :dish2_id, :dish3_id,
                                  :user_id, :address, :company_id)
  end
end
