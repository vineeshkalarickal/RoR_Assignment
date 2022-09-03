class LineItemsController < ApplicationController
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
end
