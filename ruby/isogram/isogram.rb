class Isogram
def self.isogram?(text)
  text.downcase.scan(/\w/).uniq!.nil?
end
end

