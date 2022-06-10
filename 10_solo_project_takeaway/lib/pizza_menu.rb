class PizzaMenu
  def initialize
    @pizza_list = []
    @receipt = []
    # menu is a list of dishes
    # name = pizza name
    # price = pizza price
    # name is a string, price is string with £
    # menu is an empty array  
  end

  def add(pizza) 
    @pizza_list << pizza
    # pizza is an instance of Pizza
    # Pizza gets added to the menu
    # Returns nothing
  end

  def all
    @pizza_list
    # Returns a list of pizza objects
    # all is an array of hashes
    # all starts as an empty array
  end
  
  def select_by_pizza_name(name)
    selected = @pizza_list.select do |pizza| 
      pizza.name == name
    end 
      @receipt << selected
  end
      
    def selected
      @receipt = @receipt.flatten
      return @receipt
      
    # name is a string
    # Returns pizza selected
    # if name = nil, prints error message
  end

 def print_receipt 
  print_out = @receipt.flatten.map do |pizza|
      pizza.listing
    end
    return print_out.join(", ")
     # print itemised receipt from pizza selected
     #for the pizzas selected. 
     # return menu_listing for dishes selected from menu
  end

  def sum_total
    total = @receipt.flatten.map do |pizza|
      pizza.price
    end
    prices = total.join(", ").delete("£").split(", ")
    arr = prices.map do |n| n.to_f
    end
    sum = arr.inject(:+)
    result = '%.2f' % sum
    return "Total to pay is £#{result}"
     # find total from itemised receipt
     # remove £ from string and change to float
     # puts values in an array and sum
     # return total in format £x.xx
  end
end

