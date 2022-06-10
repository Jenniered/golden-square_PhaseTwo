require 'pizza_menu'

RSpec.describe PizzaMenu do
  it "initialises with an empty array" do
    pizza_menu = PizzaMenu.new
    expect(pizza_menu.all).to eq []
  end
end
