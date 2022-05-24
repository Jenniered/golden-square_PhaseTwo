class TaskTracker
  def initialize
    #create a list for the tasks 
    @list = []
  end

  def add(task) # task is a string
    @list << task
    # adds task to @list
    # No return value
  end

  def mark_complete(task)
    fail "Not on the list" unless @list.include? task
    if @list.include? task
      @list.delete(task)
    end
    # if task is in @list, it's complete so remove from @list
    # if task isn't in @list, give error message
  end

  def see_list
    fail "Nothing on the list!" if @list.empty?
    return @list.join(", ")
  end
    # Gives error message if list is empty
    # Otherwise, returns list of tasks to do
end