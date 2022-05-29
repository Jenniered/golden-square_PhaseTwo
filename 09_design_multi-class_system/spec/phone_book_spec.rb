require 'phone_book'

RSpec.describe PhoneBook do
  it "intialises with an empty list" do
    phone_book = PhoneBook.new
    expect(phone_book.list_numbers).to eq []
  end
end

