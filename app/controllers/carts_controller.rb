class CartsController < ApplicationController
  def index
    @carts = current_user.carts
  end
  
  def create
    cart_item = CartItem.new(params_strong)
    
    if params_strong[:cart_id] == "new cart"
      cart = current_user.carts.create({status: "new", total: cart_item.price})
      cart_item.cart_id = cart.id
      cart.save
    end
    cart_item.save
    cart_item.cart.update_total
    redirect_to "/carts"
  end

  def show
    @cart = current_user.carts.find params[:id]
  end
  
  def destroy
    @cart = current_user.carts.find params[:id]
    @cart.destroy
    redirect_to "/carts"
  end
  
  def delete_item
    item = CartItem.find params[:id]
    cart = current_user.carts.find item.cart_id
    if cart
      item.destroy
    end
    redirect_to "/carts/#{cart.id}"
  end

  def update_item
    item = CartItem.find params[:id]
    cart = current_user.carts.find item.cart_id
    if cart
      item.quantity = params[:quantity]
      item.save
      
      cart.total = 0
      CartItem.where(cart_id: cart.id).each{|item| cart.total += item.price * item.quantity}
      cart.save
      render text: "ok"
    end
  end

  def params_strong
    params.require(:cart_item).permit!
  end
end
