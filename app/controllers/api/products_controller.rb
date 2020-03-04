class Api::ProductsController < ApplicationController

  def home
    @products = Product.all
    render "product_list.json.jb"
  end


end
