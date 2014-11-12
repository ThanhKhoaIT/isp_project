class Cart < ActiveRecord::Base
  has_many :cart_items
  belongs_to :user
  
  def name
    created_at.strftime("%Y-%m-%d %H:%M")
  end
  
  def update_total
    self.total = 0
    self.cart_items.each{|i| self.total += (i.price * i.quantity)}
    self.save
  end
end
