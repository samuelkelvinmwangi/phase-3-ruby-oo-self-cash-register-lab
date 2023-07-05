class CashRegister
    attr_accessor :total, :discount, :items
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      self.total += price * quantity
      quantity.times { self.items << title }
    end
  
    def apply_discount
      if discount > 0
        self.total -= (self.total * discount / 100.0).to_i
        "After the discount, the total comes to $#{total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      last_item_price = self.items.pop
      self.total -= last_item_price
    end
  end
  