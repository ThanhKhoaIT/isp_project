class HomeController < ApplicationController
  # before_action :authenticate_user!
  require 'paypal-sdk-adaptivepayments'
  
  skip_before_filter :verify_authenticity_token, :only => [:callback]
  
  def index
    @packages_recently = Package.order("id desc").first(6)
    @comments_recently = Comment.order("id desc").first(6)
  end
  
  def create_package
    redirect_to "/users/sign_in" if !user_signed_in?
  end
  
  def confirm_cart
    if user_signed_in?
      @cart = current_user.carts.find params[:id]
    else
      redirect_to "/users/sign_in"
    end
  end
  
  def confirm
    if user_signed_in?
      @cart = current_user.carts.find params[:id]
      @cart.update_total
      @api = PayPal::SDK::AdaptivePayments.new
      @pay = @api.build_pay({
        :actionType => "PAY",
        :cancelUrl => "#{APP_CONFIG['www']}",
        :currencyCode => "USD",
        :feesPayer => "SENDER",
        :ipnNotificationUrl => "#{APP_CONFIG['www']}/callback?cart=#{@cart.id}",
        :receiverList => {
          :receiver => [{
            :amount => @cart.total,
            :email => APP_CONFIG['email_paypal'] }] },
        :returnUrl => "#{APP_CONFIG['www']}" })

      # Make API call & get response
      @response = @api.pay(@pay)

      # Access response
      if @response.success? && @response.payment_exec_status != "ERROR"
        @response.payKey
        @url = @api.payment_url(@response)  # Url to complete payment
      else
        p @response.error
      end
    end
    render json: {url: @url || ""}
  end

  
  def callback
    if params[:status] and params[:status] == "COMPLETED" and params[:cart]
      cart = Cart.find params[:cart]
      if cart
        cart.status = "close"
        Usermailer.pay_success(cart).deliver if cart.saves
      end
    end
  end
  
  def active
    @user = User.find_by_token_active params[:token]
    
    if @user
      @user.active = true
      @user.token_active = ""
      @user.save(validate: false)
    end
  end

  def contacts  
    @contact = Contact.new
  end
  
  def contacts_create
    Contact.create(contact_params)
    redirect_to "/"
  end

  
  def build_package
    if user_signed_in?
      current_user.requests.create({
        cities:   params[:cities].split("|").collect{|i| i.split(",")[1]}.join(","), 
        flights:  params[:flights].split("|").collect{|i| i.split(",")[1]}.join(",")
      })      
    end
    render json: {success: true}
  end
  
  def create_package_ok
    
  end


  def cities_to
    city = City.find params[:city]
    if city
      render json: {cities: city.cities_allow_to}
    else
      render json: {cities: []}
    end
  end
  
  def flights
    if params[:from] and params[:to]
      render json: {flights: Flight.allow_move(params[:from], params[:to])}
    else
      render json: {flights: []}
    end
  end

  def contact_params
    params.require(:contact).permit!
  end


end
