class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will subtract two numbers."
    @io.puts "Please enter a number"
    number_1 = @io.gets.to_i
    @io.puts "Please enter another number"
    number_2 = @io.gets.to_i
    @io.puts "Here is your result:"
    result = number_1 - number_2
    @io.puts "#{number_1} - #{number_2} = #{result}" 
  end

end

# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run