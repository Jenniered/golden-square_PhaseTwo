{{TAKEAWAY}} Multi-Class Planned Design Recipe
1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

- See a list of dishes 
- Dishes with prices
- Select some number of dishes
- Get itemised receipt
- Sum total

https://miro.com/app/board/uXjVOxFmJ0E=/

Also design the interface of each class in more detail.

class PizzaMenu
  def initialize
    # menu is a list of dishes
    # name = pizza name
    # price = pizza price
    # name is a string, price is string with £
    # menu is an empty array  
  end

  def add(pizza) 
    # pizza is an instance of Pizza
    # Pizza gets added to the menu
    # Returns nothing
  end

  def all
    # Returns a list of pizza objects
    # all is an array of hashes
    # all starts as an empty array
  end
  
  def select_by_pizza_name(name) 
    # name is a string
    # Returns pizza selected
    # if name = nil, prints error message
  end

 def print_receipt
     # print itemised receipt from pizza selected
     for the pizzas selected. 
     # return menu_listing for dishes selected from menu
  end

  def sum_total
     # find total from itemised receipt
     # remove £ from string and change to float
     # puts values in an array and sum
     # return total in format £x.xx
  end
end

class Pizza
  def initialize(name, price) # name is a string, price is a string with £
  end

  def name
    # Returns name
  end

  def menu_listing
    # returns name and price in the format of a string "name ... price"
  end
end


3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# EXAMPLE

# Shows all pizzas
pizza_menu = PizzaMenu.new
pizza_1 = Pizza.new("Four Cheese", "£8")
pizza_2 = Pizza.new("Margarita", "£7.50")
pizza_3 = Pizza.new("Vesuvius", "£9")
pizza_menu.add(pizza_1)
pizza_menu.add(pizza_2)
pizza_menu.add(pizza_3)
pizza_menu.all # => [pizza_1, pizza_2, pizza_3]

# Selects a pizza from the menu
pizza_menu = PizzaMenu.new
pizza_1 = Pizza.new("Four Cheese", "£8")
pizza_2 = Pizza.new("Margarita", "£7.50")
pizza_3 = Pizza.new("Vesuvius", "£9")
pizza_menu.add(pizza_1)
pizza_menu.add(pizza_2)
pizza_menu.add(pizza_3)
pizza_menu.select_by_pizza_name("Margarita") # => pizza_2

# if no pizza selected
pizza_menu = PizzaMenu.new
pizza_1 = Pizza.new("Four Cheese", "£8")
pizza_2 = Pizza.new("Margarita", "£7.50")
pizza_3 = Pizza.new("Vesuvius", "£9")
pizza_menu.add(pizza_1)
pizza_menu.add(pizza_2)
pizza_menu.add(pizza_3)
menu.select("") # => "No pizza selected"

# Returns itemised receipt
pizza_menu = PizzaMenu.new
pizza_1 = Pizza.new("Four Cheese", "£8")
pizza_2 = Pizza.new("Margarita", "£7.50")
pizza_3 = Pizza.new("Vesuvius", "£9")
pizza_menu.add(pizza_1)
pizza_menu.add(pizza_2)
pizza_menu.add(pizza_3)
pizza_menu.select("Margarita")
pizza_menu.select("Four_Cheese")
pizza_menu.print_receipt # => "Margarita ... £7.50", "Four Cheese ... £8"

# Returns itemised receipt with multiple of same pizza
pizza_menu = PizzaMenu.new
pizza_1 = Pizza.new("Four Cheese", "£8")
pizza_2 = Pizza.new("Margarita", "£7.50")
pizza_3 = Pizza.new("Vesuvius", "£9")
pizza_menu.add(pizza_1)
pizza_menu.add(pizza_2)
pizza_menu.add(pizza_3)
pizza_menu.select("Margarita")
pizza_menu.select("Four_Cheese")
pizza_menu.select("Margarita")
pizza_menu.print_receipt # => "Margarita ... £7.50", "Four Cheese ... £8, "Margarita ... £7.50"

# Returns itemised receipt and sum total
pizza_menu = PizzaMenu.new
pizza_1 = Pizza.new("Four Cheese", "£8")
pizza_2 = Pizza.new("Margarita", "£7.50")
pizza_3 = Pizza.new("Vesuvius", "£9")
pizza_menu.add(pizza_1)
pizza_menu.add(pizza_2)
pizza_menu.add(pizza_3)
pizza_menu.select("Margarita")
pizza_menu.select("Four_Cheese")
pizza_menu.print_receipt # => "Margarita ... £7.50", "Four Cheese ... £8"
pizza_menu.sum_total # => # = "£15.50"

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE

# PizzaMenu
# Initializes with an empty array
pizza_menu = PizzaMenu.new
pizza_menu.all # => []

# Pizza
# Constructs a pizza
pizza = Pizza.new("Margarita", "£7.50")
Pizza.name # => "Margarita"

# Prints menu listing
pizza = Pizza.new("Margarita", "£7.50")
Pizza.menu_listing # => "Margarita ... £7.50"


Encode each example as a test. You can add to the above list as you go.


5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.