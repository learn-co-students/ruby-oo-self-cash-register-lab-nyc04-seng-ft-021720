require 'pry'
class CashRegister

    attr_accessor :total, :discount, :basket, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @basket = []
    end 

    def add_item(title, price, quantity = nil )
        if quantity 
            self.total += price * quantity
            quantity.times do @basket.push(title)
            @last_item = price * quantity
            end 
        else 
            self.total += price
            @basket.push(title)
            @last_item = price 
        end 

        

    end 

    def apply_discount()
    if discount > 0 
        self.total -= ((self.discount.to_f/100) * self.total)
        return "After the discount, the total comes to $#{self.total.to_i}."
    else 
        return "There is no discount to apply."
    end 
end 


    def items
        self.basket
    end 

    def void_last_transaction 
        
     self.total -= self.last_item
         
        
    end 
end 
