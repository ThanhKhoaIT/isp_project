class User < ActiveRecord::Base
  has_many :comments
  has_many :carts
  has_many :requests
  
  require "digest/md5"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #
  before_create :active_email

  def full_name
    [first_name, last_name].join(" ")
  end

  def avatar
    options= {size: 80, gravatar_id:Digest::MD5.hexdigest(self.email)}
    "http://www.gravatar.com/avatar.php?" + options.to_query
  end

  def active_email
    rd = (0...25).map { (65 + rand(26)).chr }.join
    self.token_active = rd
    self.active = false
    save
    Usermailer.active_email(self).deliver
  end

end
