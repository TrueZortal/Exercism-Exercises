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
      x << val unless block.call(val)
    end
    x
  end
end
