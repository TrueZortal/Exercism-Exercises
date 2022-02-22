module Enumerable
  def keep(&block)
    x = []
    each do |val|
      if block.call(val)
        x << val
      end
    end
    x
  end

  def discard(&block)
    x = []
    each do |val|
      if block.call(val) == false
        x << val
      end
    end
    x
  end
end