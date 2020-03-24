class Api::OrdersController < ApplicationController
  def index
    if current_user
      @orders = User.find(current_user.id).orders
      render "index.json.jb"
    else
      render json: {}, status: :unauthorized
    end

  end

  def show
    @order = Order.find(params[:id])
    render "show.json.jb"
  end

  def create
    if current_user
      sub_total = 0
      tax_rate = 0.1
      
      @carted_products = CartedProduct.where({user_id: current_user.id, status: "carted"})
      
      @carted_products.each do |carted_product|
        sub_total += (carted_product.quantity * carted_product.product.price)
      end
      
      tax = sub_total * tax_rate

      @order = Order.new( 
      user_id: current_user.id,
      subtotal: sub_total,
      tax: tax,
      total: sub_total + tax
      )
      @order.save

      @carted_products.each do |carted_product|
        carted_product.update({status: "purchased", order_id: @order.id})
      end
      
      render "show.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end
end
