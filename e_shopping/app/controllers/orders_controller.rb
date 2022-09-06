class OrdersController < ApplicationController
  before_action :authenticate_user!
  include AddressesHelper

  def index
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @cart = Cart.where(id: @order.cart_id, user_id: @order.user_id).first.update(status: false)
      flash[:notice] = 'Your order placed successfully!'
      redirect_to view_order_path
    else
      flash.now[:error] = 'Could not save'
      render :new
    end
  end

  def place_order
    @place_order_items = 
    LineItem.select('line_items.*, products.*, carts.id,  SUM(line_items.quantity) as tot_items').left_outer_joins( :cart, :product ).group(:product_id).where(
      ['line_items.user_id = :user_id and line_items.cart_id = :cart_id',
       { user_id: params[:user_id], cart_id: params[:cart_id] }]
    )
    @shipping_address = primary_address(current_user.id)
  end

  def order_params
    params.require(:order).permit(:user_id, :address_id, :cart_id, :final_price, :order_status)
  end
end
