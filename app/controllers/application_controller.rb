class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :layout_by_resource
  
  protect_from_forgery with: :exception
  
  before_action :check_active_account
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :password_confirmation
  end
  
  

  protected

  def layout_by_resource
    if devise_controller?
      "application"
    end
  end
  
  def check_active_account
    if user_signed_in? and current_user and current_user.active != true and params[:action] != "unactive" and params[:action] != "active"
      redirect_to "/unactive"
    end
  end

end
