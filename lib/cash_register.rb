class CashRegister
  attr_accessor :discount, :total
  
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items =[]
  end
  
  def add_item(title, price, amount=1)
    @total += price*amount
    @last_transaction = price * amount
    amount.times do
      @items << title
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
  
  def void_last_transaction
    @total -= @last_transaction
  end
  
end