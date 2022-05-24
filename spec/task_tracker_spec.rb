require 'task_tracker'

RSpec.describe TaskTracker do
  it "returns an error when list is empty" do
    task_tracker = TaskTracker.new
    expect { task_tracker.see_list}.to raise_error "Nothing on the list!"
  end

  context "if one task added to the list" do
    it "returns one item list" do
      task_tracker = TaskTracker.new
      task_tracker.add("Walk the dog")
      expect(task_tracker.see_list).to eq "Walk the dog"
    end
  end

  context "if more than one task added to the list" do
    it "returns the list" do
      task_tracker = TaskTracker.new
      task_tracker.add("Walk the dog")
      task_tracker.add("Wash the car")
      expect(task_tracker.see_list).to eq "Walk the dog, Wash the car"
    end
  end

  context "if task complete" do
    it "removes task from the list" do
      task_tracker = TaskTracker.new
      task_tracker.add("Walk the dog")
      task_tracker.add("Wash the car")
      task_tracker.mark_complete("Walk the dog")
      expect(task_tracker.see_list).to eq "Wash the car"
    end
  end

  context "if task not in the list" do
    it "fails and returns 'not on the list' " do
      task_tracker = TaskTracker.new
      task_tracker.add("Walk the dog")
      task_tracker.add("Wash the car")
      expect {task_tracker.mark_complete("Hoover the stairs") }.to raise_error "Not on the list"
    end
  end
end
