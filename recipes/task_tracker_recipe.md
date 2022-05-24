TaskTracker Class Design Recipe
1. Describe the Problem
As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.


2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

# EXAMPLE

class TaskTracker
  def initialize
    #create a list for the tasks 
    @list = []
  end

  def add(task) # task is a string
    # adds task to @list
    # No return value
  end

  def mark_complete(task)
    # if task is in @list, it's complete so remove from @list
    # if task isn't in @list, give error message
  end

  def see_list
    # Gives error message if list is empty
    # Otherwise, returns list of tasks to do
  end
end

3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

# EXAMPLE
# 1
task_tracker = TaskTracker.new
task_tracker.add("")
task_tracker.see_list # => returns error message "Nothing on the list!"

# 2
task_tracker = TaskTracker.new
task_tracker.add("Walk the dog")
task_tracker.see_list # => "Walk the dog"

# 3
task_tracker = TaskTracker.new
task_tracker.add("Walk the dog")
task_tracker.add("Wash the car")
task_tracker.see_list # => "Walk the dog, Wash the car"

# 4
task_tracker = TaskTracker.new
task_tracker.add("Walk the dog")
task_tracker.add("Wash the car")
task_tracker.mark_complete("Walk the dog")
task_tracker.see_list # => "Wash the car"

# 5
task_tracker = TaskTracker.new
task_tracker.add("Walk the dog")
task_tracker.add("Wash the car")
task_tracker.mark_complete("Hoover the stairs") # => returns error message "Not on the list"

