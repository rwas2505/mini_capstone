class Api::ProductsController < ApplicationController

  def home
    @products = Product.all
    render "product_list.json.jb"
  end

  def watch
    @watch = Product.first
    render "watch.json.jb"
  end

  def product
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "product.json.jb"
  end
end
