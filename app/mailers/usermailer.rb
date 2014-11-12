class Usermailer < ActionMailer::Base
  default from: "notification4mailer@gmail.com"
  
  def active_email(user)
    @user = user
    @url  = "#{APP_CONFIG['www']}/active/#{@user.token_active}"
    mail(to: @user.email, subject: 'Welcome to FlyAndStay LTD')
  end
  
  def pay_success(cart)
    @cart = cart
    mail(to: @cart.user.email, subject: 'Pay successful!')
  end


end
