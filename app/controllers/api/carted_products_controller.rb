class Api::CartedProductsController < ApplicationController
  def create
    @cart = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:id],
      quantity: params[:quantity],
      status: "carted"
    )

    render "show.json.jb"
  end
end
