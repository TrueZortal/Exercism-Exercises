class TwelveDays
  def self.song
    temp_gifts = ['twelve Drummers Drumming, ', 'eleven Pipers Piping, ', 'ten Lords-a-Leaping, ', 'nine Ladies Dancing, ', 'eight Maids-a-Milking, ', 'seven Swans-a-Swimming, ', 'six Geese-a-Laying, ', 'five Gold Rings, ', 'four Calling Birds, ', 'three French Hens, ', 'two Turtle Doves, ', 'a Partridge in a Pear Tree.']
    temp_order = ['twelfth','eleventh','tenth','ninth','eighth','seventh','sixth','fifth','fourth','third','second','first']
    gifts = temp_gifts.reverse
    order = temp_order.reverse
    index = 0
    puts "On the #{order[index]} day of Christmas my true love gave to me: #{gifts[index,1].join}"
    puts
    index += 1
    while index < 12 do
      if index < 11
        puts "On the #{order[index]} day of Christmas my true love gave to me: #{gifts[1,index].reverse.join}and #{gifts[0]}"
        puts ""
        index += 1
      else
      puts "On the #{order[index]} day of Christmas my true love gave to me: #{gifts[1,index+1].reverse.join}and #{gifts[0]}"
      index += 1
      end
    end
  end
end

