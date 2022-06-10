require 'pizza'

RSpec.describe Pizza do
  it "constructs a pizza" do
  pizza = Pizza.new("Margarita", "£7.50")
  expect(pizza.name).to eq "Margarita"
  end

  it "returns menu listing with name and price" do
    pizza = Pizza.new("Margarita", "£7.50")
    expect(pizza.listing).to eq "Margarita ... £7.50"
  end
end