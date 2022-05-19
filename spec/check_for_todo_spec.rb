require 'check_for_todo'

RSpec.describe "check_for_todo" do
  context "when an empty string is passed" do
    it "returns an error" do
      expect { check_for_todo("")}.to raise_error "There's no text to check."
    end
  end

  context "when a string starts with the text #TODO" do
    it "returns true" do
      expect(check_for_todo("#TODO wash the car")).to eq true
    end
  end

  context "when a string contains the #TODO anywhere in the text" do
    it "returns true" do
      expect(check_for_todo("There's so many things #TODO today")).to eq true
    end
  end
end
