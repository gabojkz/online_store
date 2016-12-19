class Basket < ApplicationRecord
  belongs_to :product
  belongs_to :client

  def self.sub_total
    joins(:product).sum("products.price")
  end

  def self.total_tax
    @total, @total_tax, @flags = 0, 0, 0
    @discount = false
    @baskets = Basket.all
    

    @baskets.each do |basket|
      
      # add taxes 
      if basket.product.vat_rate == "reduce"
       
        tax = (basket.product.price * 0.05)
        @total += (basket.product.price + tax)

        @total_tax += tax

      elsif basket.product.vat_rate == "standar"
        
        tax = (basket.product.price * 0.20)
        @total += (basket.product.price + tax )

        @total_tax += tax
      
      else #Zero
        
        @total += basket.product.price

      end
     
      # flag discount
      @flags += 1 if basket.product.product_code == 1
       
      if @flags > 0 && @flags % 2 == 0
        @total = (@total - 5.0)
      end

      # general discount
      if @total >= 70 &&  @discount == false
        discount = (@total * 0.12)
        @total = (@total - discount)
        @discount = true
      end

    end 

    puts "TOTAL = #{@total}"

    return @total
  end

end
