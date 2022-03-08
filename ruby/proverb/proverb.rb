# frozen_string_literal: true

class Proverb
  def initialize(*items, qualifier: nil)
    @items = items
    index = 0
    @proverb = []

    until index + 1 == @items.length
      first_item = @items[index]
      second_item = @items[index + 1]
      @proverb << "For want of a #{first_item} the #{second_item} was lost.\n"
      index += 1
    end
    @proverb << "And all for the want of a #{qualifier.nil? ? '' : "#{qualifier} "}#{@items[0]}."
  end

  def to_s
    @proverb.join
  end
end
