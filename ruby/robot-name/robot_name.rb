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

end

