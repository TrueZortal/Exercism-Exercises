class Bob
  def self.hey(message)
    @message = message.strip.split(/[^a-zA-Z?1-9]/).join.chars
   if @message.last == '?' && @message.length != 1 && @message.join == @message.join.upcase && @message.join.split(/[1-9]/) != ""
     "Calm down, I know what I'm doing!"
   elsif @message.last == '?'
     'Sure.'
   elsif @message.last != '?' && @message.join == @message.join.upcase && @message.join != ""
     'Whoa, chill out!'
   elsif @message.join == "" || message.chars.join == ""
    "Fine. Be that way!"
   else
     'Whatever.'
   end
  end
end

#faiing this test ~~
remark = "1, 2, 3"
puts remark.strip.split(/[^a-zA-Z?]/).join.chars.join
puts remark.strip.split(/[^a-zA-Z?]/).join.chars



