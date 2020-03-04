class Api::ProductsController < ApplicationController

  def home
    @products = Product.all
    render "product_list.json.jb"
  end

  def watch
    @watch = Product.first
    render "watch.json.jb"
  end


end
