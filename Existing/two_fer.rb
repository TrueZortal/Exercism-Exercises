class TwoFer
  def self.two_fer(x = nil)
    x.nil? ? "One for you, one for me." : "One for #{x}, one for me."
  end
end

puts TwoFer.two_fer()
puts TwoFer.two_fer("Alice")