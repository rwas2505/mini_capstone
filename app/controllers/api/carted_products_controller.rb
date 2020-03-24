class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where({user_id: current_user.id, status: "carted"})
    render "index.json.jb"
  end
  
  def create
    @cart = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:id],
      quantity: params[:quantity],
      status: "carted"
    )
    @cart.save
    render "show.json.jb"
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: 'removed')
    render json: {message: "successfully removed from shopping cart"}
  end
end
