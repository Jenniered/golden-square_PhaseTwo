require 'todo_list'

RSpec.describe TodoList do
  it "initialises with an empty list" do
  todo_list = TodoList.new
  expect(todo_list.incomplete_list).to eq []
  end
end
