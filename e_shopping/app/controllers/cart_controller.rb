# shopping cart
class CartController < ApplicationController
  before_action :authenticate_user!
  include LineItemsHelper

  def index
    @cart = Cart.where(user_id: current_user.id).first
    # if cart is not found, create a new one
    @cart = create_cart(current_user.id) if @cart.blank?
    # call helper method to create_cart_items
    create_line_items(params[:id], @cart.id)

    flash[:notice] = 'Successfully added to the cart'
  end

  def view_cart
    @cart_items = view_line_items(current_user.id)
  end

  def create_cart(user_id)
    cart = Cart.new(user_id: user_id)
    cart.save
  end
end
