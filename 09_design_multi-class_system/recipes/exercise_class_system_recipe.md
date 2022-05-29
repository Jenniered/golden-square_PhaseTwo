Diary, Todo list and phonebook Multi-Class Planned Design Recipe

1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries


2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

Diary
record experiences
Read past diary entries
Select diary entries - time I have and reading speed

Todo list
Keep track of tasks

Phonebook
See a list of phone numbers - from diary entries

https://miro.com/app/board/uXjVOxFmJ0E=
 
Also design the interface of each class in more detail.

class Diary
  def initialize
  # list as an empty array
  end

  def add(entry) 
  # diary is an instance of DiaryEntry
  # DiaryEntry gets added to the Diary
  # Returns nothing
  end

  def all
  # Returns a list of diary entries
  end
  
  def select_entry(wpm, minutes) 
  # wpm is number of words can read in a minute
  # minutes is time available to read
  # Returns a diary entry that can read in time available - reading time needs to be less than time available, select best entry for time
  end
end

class DiaryEntry
  def initialize(title, contents) 
  # title and contents are both strings
  end

  def title
  # returns title
  end

  def contents
  # returns contents
  end

  def word_count
  # Returns word count for diary entry
  end

  def reading_time(wpm)
  # calculates reading time of diary entry based on wpm
  end
end

class TodoList
  def initialize
  # incomplete list is an empty array
  end

  def add_task
  # adds a task to the incomplete list
  end

  def incomplete_list
  #  returns list of just incomplete tasks
  end

  def complete_list
  # returns list of complete tasks
  end
end

class TodoTask
  def initialize(task)
  #  task is a string
  end

  def task
  # returns task
  end

  def mark_complete
  # marks a task as complete
  # returns nothing
  end

  def done?
  # returns true if task done
  end

class PhoneBook
  def initialize
  # numbers is an empty array
  end

  def extract
  # extracts the numbers from diary entries
  # looks for a number with 11 digits
  # doesn't save duplicates
  end

  def list_numbers
  # returns list of phone numbers
  # phone numbers stored as strings
  end 

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# EXAMPLE

# Gets all diary entries
diary = Diary.new
diary_entry_1 = DiaryEntry.new("title1", "contents one")
diary_entry_2 = DiaryEntry.new("title2, "contents two")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.all #=> [diary_entry_1, diary_entry_2]

# Selects diary entry to read
diary = Diary.new
diary_entry_1 = DiaryEntry.new("title1", "contents one two buckle my shoe three four")
diary_entry_2 = DiaryEntry.new("title2, "contents two four six eight")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.select(4, 2) #=> diary_entry_1

# Gets list of phone numbers
phone_book = PhoneBook.new
diary_entry_1 = DiaryEntry.new("its title", "Mary had a little lamb its phone number was 07890300300")
diary_entry_2 = DiaryEntry.new("the title", "Barry is coming for tea 07880400400")
diary.add(diary_entry1)
phone_book.extract
phone_book.list_numbers #=> "07890300300", "07880400400"

# Gets list of all incomplete tasks
todo_list = TodoList.new
todo_task_1 = TodoTask.new
todo_task_2 = TodoTask.new
todo_task_3 = TodoTask.new
todo_list.add(todo_task_1)
todo_list.add(todo_task_2)
todo_list.add(todo_task_3)
todo_list.incomplete #=> [todo_task_1, todo_task_2, todo_task_3]

# Gets list of all complete tasks
todo_list = TodoList.new
todo_task_1 = TodoTask.new
todo_task_2 = TodoTask.new
todo_task_3 = TodoTask.new
todo_list.add(todo_task_1)
todo_list.add(todo_task_2)
todo_list.add(todo_task_3)
todo_task.mark_complete(todo_task_2)
todo_task.mark_complete(todo_task_3)
todo_list.list_complete #=> [todo_task_2, todo_task_3]

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE

# DiaryEntry
# Constructs a diary entry
diary_entry = DiaryEntry.new("my title", "some contents have a nice day")
diary_entry.title # => "my title"
diary_entry.contents # => "some contents have a nice day"

# Counts the words of a diary entry
diary_entry = DiaryEntry.new("my title", "some contents have a nice day")
diary_entry.word_count # => 6

# Calculates the reading time of a diary entry
diary_entry = DiaryEntry.new("my title", "some contents have a nice day")
diary_entry.count_words
diary_entry.reading_time(3) # => 2

# Diary
# initializes with an empty list
diary = Diary.new
diary.all # => []

# TodoTask
# Constructs a task
todo_task = TodoTask.new("Walk the dog")
todo_task.task # => "Walk the dog"

# Marks a task complete
todo_task = TodoTask.new("Walk the dog")
todo_task.mark_complete
todo_task.done? # => true

# TodoList
# initialises with an empty list
todo_list = TodoList.new
todo_list.incomplete_list # => []

# PhoneBook
# initialise with an empty array
phone_book = PhoneBook.new
phone_book.list_numbers # => []


Encode each example as a test. You can add to the above list as you go.

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.