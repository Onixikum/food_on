class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :index

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.where(user_id: @user.id)
    @array_price = []
    @orders.each do |order|
      @order = order
      order_info
      array_price
    end
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the FoodON!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation, :admin)
    end
end
