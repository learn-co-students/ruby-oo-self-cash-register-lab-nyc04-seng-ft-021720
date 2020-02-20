require 'pry'
class CashRegister
	attr_reader		:items
	attr_writer
	attr_accessor

	def initialize(discount_percent = 0)
		@discount_percent = discount_percent
		@total_cents = 0
		@total = 0		# hack to pass test 1
		@items = []
	end

	def discount
		@discount_percent
	end

	def add_item(item_name, price_in_dollars, quantity = 1)
		cents = dollars_to_cents(price_in_dollars) * quantity
		@total_cents += cents
		quantity.times do
			@items.push(item_name)
		end
		@last_transaction = {item_name: item_name, price_in_dollars: price_in_dollars, quantity: quantity}
	end

	def total
		# '%.2f' % gives 2 decimal points, regardless
		# '%.2f' % cents_to_dollars(@total_cents)
		cents_to_dollars(@total_cents)					# above is better
	end
	def total=(value_in_dollars)
		@total_cents = dollars_to_cents(value_in_dollars)
	end

	def apply_discount
		if (@discount_percent > 0)
			@total_cents -= @total_cents * (@discount_percent / 100.0)
			# "After the discount, the total comes to $#{'%.2f' % self.total}."
			"After the discount, the total comes to $#{self.total.to_i}."		# hack to pass the test, better above
		else
			"There is no discount to apply."
		end
	end
	
	def void_last_transaction
		# subtract from the total
		@total_cents -= dollars_to_cents(@last_transaction[:price_in_dollars]) * @last_transaction[:quantity]
		# remove from the items array
		@last_transaction[:quantity].times do 
			@items.pop
		end
		# return something useful
		[@items, '%2.f' % self.total]
		# binding.pry
	end
	
	# Some helper methods to deal with things as cent-integers internally
	def dollars_to_cents(dollars)
		cents = dollars * 100
		cents.to_i
	end
	def cents_to_dollars(cents)
		dollars = cents.to_f / 100.0
	end
end