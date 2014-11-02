class HomeController < ApplicationController
  # before_action :authenticate_user!
  
  def index
    @packages_recently = Package.last(6)
  end
  
  def create_package
    
  end


end
