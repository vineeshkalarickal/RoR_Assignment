class HomeController < ApplicationController

  def index
    @products = Product.all
  end

  def faq

  end

  def contact_us
    
  end

end
