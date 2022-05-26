require 'todo'
require 'todo_list'

# 1 gets a list of incomplete todos - do one first, then multiple
RSpec.describe "to do integration" do
  context "when a todo is added and not complete" do
    it "returns the todo on the non-done todos" do
      todo_list = TodoList.new
      todo1 = Todo.new("todo1")
      todo_list.add(todo1)
      expect(todo_list.incomplete).to eq [todo1]
    end
  end

  context "when multiple todos are added and not complete" do
    it "returns the list as non-done todos" do
      todo_list = TodoList.new
      todo_1 = Todo.new("todo_1")
      todo_2 = Todo.new("todo_2")
      todo_3 = Todo.new("todo_3")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      expect(todo_list.incomplete).to eq [todo_1, todo_2, todo_3]
    end
  end

# 2 gets a list of complete todos
  it "returns a list of complete todos" do
    todo_list = TodoList.new
    todo_1 = Todo.new("todo_1")
    todo_2 = Todo.new("todo_2")
    todo_3 = Todo.new("todo_3")
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    todo_list.add(todo_3)
    todo_1.mark_done!
    todo_3.mark_done!
    expect(todo_list.complete).to eq [todo_1, todo_3]
  end

  it "returns a list of incomplete todos when some are complete" do
    todo_list = TodoList.new
    todo_1 = Todo.new("todo_1")
    todo_2 = Todo.new("todo_2")
    todo_3 = Todo.new("todo_3")
    todo_4 = Todo.new("todo_4")
    todo_list.add(todo_1)
    todo_list.add(todo_2)
    todo_list.add(todo_3)
    todo_list.add(todo_4)
    todo_1.mark_done!
    todo_3.mark_done!
    expect(todo_list.incomplete).to eq [todo_2, todo_4]
  end

# 3 tests give up that all todos marked complete
  context "it marks all todos as complete" do
    it "returns an empty list of incomplete todos and all todos on complete list" do
      todo_list = TodoList.new
      todo_1 = Todo.new("todo_1")
      todo_2 = Todo.new("todo_2")
      todo_3 = Todo.new("todo_3")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      todo_list.give_up!
      expect(todo_list.incomplete).to eq []
      expect(todo_list.complete).to eq [todo_1, todo_2, todo_3]
    end
  end

end