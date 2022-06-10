class Pizza
  def initialize(name, price) # name is a string, price is a string with £
    @name = name
    @price = price

  end

  def name
    @name
    # Returns name
  end

  def price
    @price
  end

  def listing
    return "#{@name} ... #{@price}"
    # returns name and price in the format of a string "name ... price"
  end
end

