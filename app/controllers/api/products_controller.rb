class Api::ProductsController < ApplicationController
  before_action :authenticate_admin

  def index
    @products = Product.where('name LIKE ?', "%#{params[:search]}%")

    if params[:discount] == 'true'
      @products = @products.where("price < 10")
    end

    if params[:sort] && params[:sort_order]
      @products = @products.order(params[:sort] => params[:sort_order])
    else
      @products = @products.order(:id)
    end

    render "index.json.jb"
  end

  def show
    id = params[:id]
    @product = Product.find_by(id: id)
    render "show.json.jb"
  end

  def create
    #create a new product
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )

    if @product.save 
      render "show.json.jb"
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
      
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render "destroy.json.jb"
  end
end
