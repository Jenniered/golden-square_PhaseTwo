require 'diary_entry'
require 'diary'
require 'todo_list'
require 'todo_task'
require 'phone_book'

RSpec.describe "diary, todo and phone_book integration" do
  it "returns all diary entries in a list" do
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("title1", "contents one")
    diary_entry_2 = DiaryEntry.new("title2", "contents two")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    expect(diary.all).to eq [diary_entry_1, diary_entry_2]
  end

  context "when user has given number of minutes and a wpm" do
    it "returns diary entry that can be read in the time" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("title1", "contents one two buckle my shoe three four")
      diary_entry_2 = DiaryEntry.new("title2", "contents two four six eight")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.select_entry(4, 2)).to eq diary_entry_1
    end
  end

  context "when there is a phone number within a diary entry it extracts the number" do
    it "returns it in the list of numbers" do
    phone_book = PhoneBook.new
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("its title", "Mary had a little lamb its phone number was 07890300300")
    diary.add(diary_entry_1)
    phone_book.extract(diary_entry_1)
    expect(phone_book.list_numbers).to eq ["07890300300"]
    end
  end

  context "when there are phone numbers within multiple diary entries it extracts the numbers" do
    it "returns the list of numbers" do
    phone_book = PhoneBook.new
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("its title", "Mary had a little lamb its phone number was 07890300300")
    diary_entry_2 = DiaryEntry.new("the title", "Barry is coming for tea 07880400400")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    phone_book.extract(diary_entry_1)
    phone_book.extract(diary_entry_2)
    expect(phone_book.list_numbers).to eq ["07890300300", "07880400400"]
    end
  end

  context "when there are duplicate phone numbers within diary entries" do
    it "only saves one in the list of numbers" do
    phone_book = PhoneBook.new
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("its title", "Mary had a little lamb its phone number was 07890300300")
    diary_entry_2 = DiaryEntry.new("the title", "Barry is coming for tea 07890300300")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    phone_book.extract(diary_entry_1)
    phone_book.extract(diary_entry_2)
    expect(phone_book.list_numbers).to eq ["07890300300"]
    end
  end

  context "when there are duplicate phone numbers within diary entries" do
    it "only saves one in the list of numbers" do
    phone_book = PhoneBook.new
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("its title", "Mary had a little lamb its phone number was 07890300300")
    diary_entry_2 = DiaryEntry.new("the title", "Barry is coming for tea 07890300300")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    phone_book.extract(diary_entry_1)
    phone_book.extract(diary_entry_2)
    expect(phone_book.list_numbers).to eq ["07890300300"]
    end
  end

  context "when there are other numbers in diary entries" do
    it "only extracts ones with 11 digits" do
    phone_book = PhoneBook.new
    diary = Diary.new
    diary_entry_1 = DiaryEntry.new("its title", "Mary had a little lamb its phone number was 07890300300")
    diary_entry_2 = DiaryEntry.new("the title", "Barry is coming for tea 03003008765")
    diary.add(diary_entry_1)
    diary.add(diary_entry_2)
    phone_book.extract(diary_entry_1)
    phone_book.extract(diary_entry_2)
    expect(phone_book.list_numbers).to eq ["07890300300"]
    end
  end

   context "to keep a track of todo tasks" do 
    it "returns a list of incomplete tasks" do
    todo_list = TodoList.new
    todo_task_1 = TodoTask.new("Walk the dog")
    todo_task_2 = TodoTask.new("Wash the dishes")
    todo_task_3 = TodoTask.new("Hoover the stairs")
    todo_list.add_task(todo_task_1)
    todo_list.add_task(todo_task_2)
    todo_list.add_task(todo_task_3)
    expect(todo_list.incomplete_list).to eq [todo_task_1, todo_task_2, todo_task_3]
    end
  end
  
    context "after tasks are completed" do
      it "returns a list of complete and incomplete tasks" do
        todo_list = TodoList.new
        todo_task_1 = TodoTask.new("Walk the dog")
        todo_task_2 = TodoTask.new("Wash the dishes")
        todo_task_3 = TodoTask.new("Hoover the stairs")
        todo_list.add_task(todo_task_1)
        todo_list.add_task(todo_task_2)
        todo_list.add_task(todo_task_3)
        todo_task_2.mark_complete
        todo_task_3.mark_complete
        expect(todo_list.complete_list).to eq [todo_task_2, todo_task_3]
        expect(todo_list.incomplete_list).to eq [todo_task_1]
      end
    end
  end