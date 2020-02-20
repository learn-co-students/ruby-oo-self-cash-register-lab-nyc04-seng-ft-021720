class CashRegister

attr_accessor :total,:discount,:items,:last_item_price,:last_item_quantity


    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end



    def add_item(title,price,quantity=1)
    @last_item_price = price.to_f
    @last_item_quantity = quantity
    @total += (price.to_f * quantity)
    counter = 0
    while counter < quantity
    @items << title
    counter += 1
    end
    counter = 0
    end


    def cash_register_with_discount
    end

    def void_last_transaction
    @total = @total - @last_item_price * @last_item_quantity
    end

    def apply_discount 
        if @discount == 0
            "There is no discount to apply."
        else
             @total = (@total * (100 - @discount) / 100)
        "After the discount, the total comes to $"+@total.to_i.to_s+"."
        end
    end
end
