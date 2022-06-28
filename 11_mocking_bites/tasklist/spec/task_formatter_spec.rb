require 'task_formatter'

RSpec.describe TaskFormatter do
  it "formats an incomplete task" do
    task = double :task, title: "walk the dog", complete?: false
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "[ ] walk the dog"
  end

  it "formats a complete task" do
    task = double :task, title: "wash the car", complete?: true
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "[x] wash the car"
  end

  it "formats an incomplete task" do
    task = double :task, title: "wash the dog", complete?: false
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "[ ] wash the dog"
  end
end