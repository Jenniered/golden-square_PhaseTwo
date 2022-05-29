require 'todo_task'

RSpec.describe TodoTask do
  it "constructs a task" do
  todo_task = TodoTask.new("Walk the dog")
  expect(todo_task.task).to eq "Walk the dog"
  end

  context "marks a task complete when done" do
    it "returns true if done" do
      todo_task = TodoTask.new("Walk the dog")
      todo_task.mark_complete
      expect(todo_task.done?).to eq true
    end
  end
end

