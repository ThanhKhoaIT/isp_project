class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  
  def index
    
  end

  protected
  def check_admin
    redirect_to "/" if current_user.role != "admin"
  end


end
