require 'pry'

class CashRegister
  
  
  attr_accessor :total, :title, :price, :num, :discount, :item, :transaction
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, quantity=1) 
    @item = item
    @total += (price * quantity)
    quantity.times do @items.push(item)
    @transaction = price*quantity
    end
  end
  
  def apply_discount
    if @discount != 0
      @total = (total*(0.01*(100-@discount))).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items
  end

  def total
    @total
  end
  
  def void_last_transaction
    @total -= @transaction
    @total
  end
  
end