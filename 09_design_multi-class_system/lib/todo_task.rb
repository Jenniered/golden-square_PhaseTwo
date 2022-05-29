class TodoTask
  def initialize(task)
    @task = task
  #  task is a string
  end

  def task
    @task
  # returns task
  end

  def mark_complete
    @task = @task + "DONE"
  # marks a task as complete
  # returns nothing
  end

  def done?
    @task.include? "DONE"
  # returns true if task done
  end
end