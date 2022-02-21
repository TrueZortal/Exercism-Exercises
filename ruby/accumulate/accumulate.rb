# frozen_string_literal: true

module Enumerable
  def accumulate(&block)
    x = []
    each do |val|
      x << block.call(val)
    end
    x
  end
end
