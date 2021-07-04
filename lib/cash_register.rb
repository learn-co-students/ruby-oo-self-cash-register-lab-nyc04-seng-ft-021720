require 'pry'

class CashRegister

  attr_accessor :total, :discount, :discounted_total, :cart, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    @last_transaction = 0
  end

  def total
    return @total
  end

  def add_item(title, price, quant = 1)
    # binding.pry
    @total += price * quant
    quant.times {@cart << title}
    # need to allow last_transaction to update as we add items to the cart...
    @last_transaction = (price * quant)
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply." 
    else
      @total -= ((@discount/100.0) * @total).to_i
    # binding.pry 
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    # binding.pry
    @cart
  end
#whats the difference between using self. and an instance variable?
  def void_last_transaction
    # binding.pry
    @total = 0.0 if @cart == []
    @total -= @last_transaction
  end
end