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
      product = Product.find(params[:product_id])
      the_subtotal = params[:quantity].to_i * product.price
      p tax_rate = 0.09
      p tax = the_subtotal * tax_rate 
      p total = the_subtotal + tax

      @order = Order.new(
        user_id: params[:user_id],
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: the_subtotal,
        tax: tax,
        total: total
      )

      if @order.save
        render "show.json.jb"
      else
        render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
    
  end
end
