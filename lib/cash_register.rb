require 'pry'

class CashRegister
    attr_accessor :total, :discount, :title, :items

    def initialize(discount=nil)
        @total = 0.0
        @discount = discount
        @cart = []
        @last_transaction = []
    end

    def add_item(title, price, quantity=1)
        @price = price.to_f
        @quantity = quantity
        quantity.times {@cart << title} # add each item to the cart based on its quantity
        @total += (price * quantity)
        @last_transaction = (price * quantity)
    end
    
    def apply_discount
        if @discount == nil
            p "There is no discount to apply."
        else
            @total = (self.total * 0.80)
            p "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @cart
    end

    def void_last_transaction
        @total = (total - @last_transaction)
    end

end