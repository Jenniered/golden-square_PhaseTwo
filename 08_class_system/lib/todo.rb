class Todo
  def initialize(task) # task is a string
    @task = task
  end

  def task
    @task
    # Returns the task as a string
  end

  def mark_done!
    @task = @task + "DONE!"
    # Marks the todo as done
    # Returns nothing
  end

  def done?
    @task.include? "DONE!"
    # Returns true if the task is done
    # Otherwise, false
  end
end
