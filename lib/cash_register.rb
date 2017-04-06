class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(n=0)
    @total = 0
    @transactions = []
    @items = []
    @discount = n
  end

  def add_item(title, price, amount = 1)
    amount.times do
      @items << title
      @transactions << {title: title, price: price, amount: amount}
    end
    @total += price * amount
  end

  def apply_discount
    return "There is no discount to apply." if @discount == 0
    @total *= (100-@discount) * 0.01
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def items() @items end

  def void_last_transaction
    @total -= @transactions.last[:price] * @transactions.last[:amount]
    @items.pop
    @transactions.pop
  end

end
