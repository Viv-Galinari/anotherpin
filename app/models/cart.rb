class Cart < ApplicationRecord

  has_many :order_items

  def total_quantity
    # start from zero
     @count = 0

     # found all items and loop them over
     # Overwrite the variable count by adding 1 each time
    order_items.all.each do |item|
      @count = @count + item.quantity
    end

      # Return count variable with final amount
      @count
   end

   def total_price
     @total = 0

     order_items.all.each do |item|
       @total = @total + item.product.price * item.quantity
      end

       @total
   end

   def total_price_in_pounds
     @total = 0

     order_items.all.each do |item|
       @total = @total + item.product.price_in_pounds * item.quantity
     end
     @total

   end


end
