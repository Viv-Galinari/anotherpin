class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
       @product = Product.find(params[:id])

       # check if there is an order_item already set up
       # this will work because we checking for current_cart before any action in the site

       # if the product is already in the cart
       @order_item = @current_cart.order_items.find_by(product: @product)

       # we might not have an order item or product, in that case we set it for nil
       if @order_item.nil?
       # if it doesnt exist in the cart, we make one
       @order_item = @current_cart.order_items.new(product: @product, quantity: 1)
       end
   end

end
