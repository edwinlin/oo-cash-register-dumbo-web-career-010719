class CashRegister
  attr_accessor :total, :discount
  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_tran = 0
  end
  
  def add_item(title, price, quantity = nil)
    if quantity.nil?
      @last_tran = price
      @total += price
      @items << title
    else
      @last_tran = price * quantity
      @total += price * quantity
      quantity.times{@items << title}
    end
  end
  
  def apply_discount
    if @discount.nil?
      return "There is no discount to apply."
    else
      @total -= (@total * @discount/100)
      return "After the discount, the total comes to $#{@total}."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total -= @last_tran
  end
  
end