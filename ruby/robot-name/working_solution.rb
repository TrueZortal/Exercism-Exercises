class Robot

  @@all_names = 'AA000'..'ZZ999'

  @@names = @@all_names.to_a.shuffle.each

  def self.forget
    @@names = @@all_names.to_a.shuffle.each
  end

  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = @@names.next
  end



  # def name_the_robot
  #   @robot_name = []
  #   0.upto(1) do
  #   @robot_name << @alphabet[rand(26)]
  #   end
  #   0.upto(2) do
  #   @robot_name << rand(10)
  #   end
  #   @@existing_names << @robot_name.join
  #   @robot_name.join
  # end
end

