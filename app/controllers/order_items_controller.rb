class OrderItemsController < ApplicationController

  def create
     # find the product
     @product = Product.find(params[:product_id])

     # quantity? - comes from the form data
     @quantity = form_params[:quantity]

     # add to the cart. When creating we match what we want to create, ie.: product with product variable
     @current_cart.order_items.create(product: @product, quantity: @quantity)

     flash[:success] = "Thanks for adding to your cart"

     redirect_to cart_path
   end

   def form_params
     params.require(:order_item).permit(:quantity)
   end

   def update
     @product = Product.find(params[:product_id])

     @order_item = OrderItem.find(params[:id])

     @order_item.update(form_params)

     flash[:success] = "Thanks for updating your cart"

     redirect_to cart_path
   end

   def destroy
     # find the product by params id
     # find the order item params id
     @product = Product.find(params[:product_id])
     @order_item = OrderItem.find(params[:id])

     @order_item.delete

     flash[:success] = "Product removed from cart"

     redirect_to cart_path
   end



end
