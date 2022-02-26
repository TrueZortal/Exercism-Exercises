class WordProblem
  def initialize(problem)
    @operations = [
      {name: 'plus', operation: '+'},
      {name: 'minus', operation: '-'},
      {name: 'multiplied', operation: '*'},
      {name: 'divided', operation: '/'}
    ]
    @problem = problem
  end

  def answer
    convert_to_an_array
    interpret_to_integers_and_operations
    calculate
  end

  private

  def convert_to_an_array
    @array_of_words = @problem.split(/[' '?]/)
  end

  def interpret_to_integers_and_operations
    @translation = []
    @array_of_words.each do |x|
    if x.to_i != 0 && x != '0'
      @translation << x.to_i
    elsif @operations.select {|operation| operation[:name].include?(x)}.any?
      @translation << @operations.select {|operation| operation[:name].include?(x)}[0][:operation]
    end
    end
    raise ArgumentError unless @translation.length > 2
    @translation
  end

  def calculate
    if @translation.length == 3
      @translation[0].public_send(@translation[1], @translation[2])
    elsif @translation.length == 5
      first_operation = @translation[0].public_send(@translation[1], @translation[2])
      first_operation.public_send(@translation[3], @translation[4])
    end
  end
end

