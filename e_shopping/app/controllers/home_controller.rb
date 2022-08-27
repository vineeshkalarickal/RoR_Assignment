class HomeController < ApplicationController

  def index
    @products = Product.all
  end

  def faq

  end

  def contact_us
    
  end

  def profile
    unless user_signed_in?
      redirect_to products_path
    end
  end
end
