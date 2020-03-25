class ProductsController < ApplicationController
  def index
    @product = Product.all
    render 'index.html.erb'
  end
  
end
