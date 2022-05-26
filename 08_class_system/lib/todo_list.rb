class TodoList
  def initialize
    @list = []
  end

  def add(todo) # todo is an instance of Todo
    @list << todo
    # Returns nothing
  end

  def incomplete
    incomplete_todos = @list.select do |todo|
      todo.done? != true
    end
    return incomplete_todos
    # Returns all non-done todos
  end

  def complete
    complete_todos = @list.select do |todo|
      todo.done? == true
    end
    return complete_todos
    # Returns all complete todos
  end

  def give_up!
    @list.map(&:mark_done!)
    #refactored from
    # map do |todo|
    # todo.mark_done!
    # end
  # Marks all todos as complete
  end
end
