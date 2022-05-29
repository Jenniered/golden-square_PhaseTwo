class TodoList
  def initialize
    @incomplete = []
  # incomplete list is an empty array
  end

  def add_task(task)
    @incomplete << task
  # adds a task to the incomplete list
  end

  def incomplete_list
    incomplete_tasks = @incomplete.select do |task|
      task.done? != true
    end
  #  returns list of just incomplete tasks
  end

  def complete_list
    complete_tasks = @incomplete.select do |task|
      task.done? == true
    end
    return complete_tasks
  # returns list of complete tasks
  end
end
