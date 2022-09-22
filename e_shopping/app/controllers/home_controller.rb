# Index page for the project.
class HomeController < ApplicationController
  def index
    @products = Product.order('created_at DESC')
  end

  def faq; end

  def contact_us; end

  def profile
    redirect_to products_path unless user_signed_in?
  end
end
