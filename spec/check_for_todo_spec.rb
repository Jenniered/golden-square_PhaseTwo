require 'check_for_todo'

RSpec.describe "check_for_todo" do
  context "when an empty string is passed" do
    it "returns an error" do
      expect { check_for_todo("")}.to raise_error "There's no text to check."
    end
  end
end
