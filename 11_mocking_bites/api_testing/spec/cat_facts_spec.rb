require 'cat_facts'

RSpec.describe CatFacts do
  it "returns a cat fact" do
    requester_double = double :requester
    expect(requester_double).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"According to a Gallup poll, most American pet owners obtain their cats by adopting strays.","length":90}')
    cat_fact = CatFacts.new(requester_double)
    expect(cat_fact.provide).to eq "Cat fact: According to a Gallup poll, most American pet owners obtain their cats by adopting strays."
  end
end

