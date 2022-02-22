# frozen_string_literal: true

module Enumerable
  def keep(&block)
    x = []
    each do |val|
      x << val if block.call(val)
    end
    x
  end

  def discard(&block)
    x = []
    each do |val|
      x << val if block.call(val) == false
    end
    x
  end
end
