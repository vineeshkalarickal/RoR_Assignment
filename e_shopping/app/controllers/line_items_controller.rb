class LineItemsController < ApplicationController
  before_action :authenticate_user!
  include AddressesHelper

  def index; end

  def create; end

  def destroy

    LineItem.destroy_by(
      ['product_id = :product_id and user_id = :user_id and cart_id = :cart_id',
       { product_id: params[:p_id], user_id: params[:u_id], cart_id: params[:id] }]
      )

    flash[:note] = 'Deleted succesfully'
    redirect_to cart_path
  end

  def place_order
    @place_order_items = 
    LineItem.select('line_items.*, products.*, carts.id,  SUM(line_items.quantity) as tot_items').left_outer_joins( :cart, :product ).group(:product_id).where(
      ['line_items.user_id = :user_id and line_items.cart_id = :cart_id',
       { user_id: params[:user_id], cart_id: params[:cart_id] }]
    )
    @shipping_address = primary_address(current_user.id)
  end
end
