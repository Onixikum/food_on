class CompaniesController < ApplicationController # :nodoc:
  before_action :signed_in_user, only: [:index, :new, :create]
  before_action :admin_user, only: [:new, :create]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = 'Add company!'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
