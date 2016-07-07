class StaticPagesController < ApplicationController

  def home
    @companies = Company.all
  end

  def help
  	
  end  
end
