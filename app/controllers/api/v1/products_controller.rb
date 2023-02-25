class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: product
    else
      render json: {error: "Product not found"}, status: 404
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: {error: "Product not created"}, status: 404
    end
  end

  # update product
  def update
    product = Product.find_by(id: params[:id])
    if product
      product.update(product_params)
      render json: product, status: 200
    else
      render json: {error: "Product not found"}, status: 404
    end
  end


  # delete product
  def destroy
    product = Product.find_by(id: params[:id])
    if product
      product.destroy
      render json: {message: "Product deleted"}, status: 200
    else
      render json: {error: "Product not found"}, status: 404
    end
  end


  def product_params
    params.require(:product).permit(:name, :price, :brand )
  end
end
 