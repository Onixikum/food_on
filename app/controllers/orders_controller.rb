class OrdersController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :create]
  before_action :admin_user,     only: :index

  def index
    @orders = Order.where(created_at: Time.now.midnight..(Time.now.midnight + 1.day))
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
    total_price
  end

  def show
    @order = Order.find(params[:id])
    order_info
  end

  def new
    correct_menu
    @order = Order.new
    company_fix
    menu
  end

  def create
    @order = Order.new(order_params)
    correct_order
  end

  private

    def order_params
      params.require(:order).permit(:dish1_id, :dish2_id, :dish3_id, 
                                    :user_id, :address, :company_id)
    end
end