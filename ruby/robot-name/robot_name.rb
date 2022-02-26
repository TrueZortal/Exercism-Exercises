class Robot

  @@existing_names = []

  def initialize
    @alphabet = *('A'..'Z')
    name_the_robot
    if @@existing_names.count(@robot_name.join) != 1
      name_the_robot
    end
  end

  def name
    @robot_name.join
  end

  def reset
    name_the_robot
    if @@existing_names.count(@robot_name.join) != 1
      name_the_robot
    end
  end

  def self.forget
  @@existing_names = []
  end

  def name_the_robot
    @robot_name = []
    0.upto(1) do
    @robot_name << @alphabet[rand(26)]
    end
    0.upto(2) do
    @robot_name << rand(10)
    end
    @@existing_names << @robot_name.join
    @robot_name.join
  end
end

