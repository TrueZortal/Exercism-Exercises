# frozen_string_literal: true

class FlattenArray
  def self.flatten(ary)
    flat = []
    ary.each do |x|
      if x.instance_of?(Array)
        flat += x.join('-').split('-').map(&:to_i)
      elsif x.instance_of?(Integer)
        flat << x
      end
    end
    flat
  end
end
