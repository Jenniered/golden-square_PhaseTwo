require 'todo'

RSpec.describe Todo do
  it "returns a task as a string" do
    todo = Todo.new("Wash the car")
    expect(todo.task).to eq "Wash the car"
  end

  it "returns true if the task is done" do
    todo = Todo.new("Wash the car")
    todo.mark_done!
    expect(todo.done?).to eq true
  end

  it "returns false if the task is not done" do
    todo = Todo.new("Walk the dog")
    expect(todo.done?).to eq false
  end

end
