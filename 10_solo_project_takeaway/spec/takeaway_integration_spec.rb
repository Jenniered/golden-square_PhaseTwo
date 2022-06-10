require 'pizza_menu'
require 'pizza'

RSpec.describe "takeaway_integration" do
  it "shows a list of all pizzas and their prices" do
  pizza_menu = PizzaMenu.new
  pizza_1 = Pizza.new("Four Cheese", "£8")
  pizza_2 = Pizza.new("Margarita", "£7.50")
  pizza_3 = Pizza.new("Vesuvius", "£9")
  pizza_menu.add(pizza_1)
  pizza_menu.add(pizza_2)
  pizza_menu.add(pizza_3)
  expect(pizza_menu.all).to eq [pizza_1, pizza_2, pizza_3]
  end

  context "when a user wants to order" do
    it "selects a pizza from the menu" do
    pizza_menu = PizzaMenu.new
    pizza_1 = Pizza.new("Four Cheese", "£8")
    pizza_2 = Pizza.new("Margarita", "£7.50")
    pizza_3 = Pizza.new("Vesuvius", "£9")
    pizza_menu.add(pizza_1)
    pizza_menu.add(pizza_2)
    pizza_menu.add(pizza_3)
    pizza_menu.select_by_pizza_name("Margarita")
    pizza_menu.select_by_pizza_name("Vesuvius")
    expect(pizza_menu.selected).to eq [pizza_2, pizza_3]
    end
  end

  context "when user selects their order" do
    it "returns an itemised receipt" do
    pizza_menu = PizzaMenu.new
    pizza_1 = Pizza.new("Four Cheese", "£8")
    pizza_2 = Pizza.new("Margarita", "£7.50")
    pizza_3 = Pizza.new("Vesuvius", "£9")
    pizza_menu.add(pizza_1)
    pizza_menu.add(pizza_2)
    pizza_menu.add(pizza_3)
    pizza_menu.select_by_pizza_name("Margarita")
    pizza_menu.select_by_pizza_name("Four Cheese")
    expect(pizza_menu.print_receipt).to eq "Margarita ... £7.50, Four Cheese ... £8"
    end
  end

  context "when user selects their order" do
    it "returns the total paid" do
    pizza_menu = PizzaMenu.new
    pizza_1 = Pizza.new("Four Cheese", "£8")
    pizza_2 = Pizza.new("Margarita", "£7.50")
    pizza_3 = Pizza.new("Vesuvius", "£9")
    pizza_menu.add(pizza_1)
    pizza_menu.add(pizza_2)
    pizza_menu.add(pizza_3)
    pizza_menu.select_by_pizza_name("Margarita")
    pizza_menu.select_by_pizza_name("Four Cheese")
    expect(pizza_menu.sum_total).to eq "Total to pay is £15.50"
    end
  end
end
