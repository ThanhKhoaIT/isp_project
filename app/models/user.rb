class User < ActiveRecord::Base
  require "digest/md5"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

  has_many :comments

  def full_name
    [first_name, last_name].join(" ")
  end

  def avatar
    options= {size: 80, gravatar_id:Digest::MD5.hexdigest(self.email)}
    "http://www.gravatar.com/avatar.php?" + options.to_query
  end

end
