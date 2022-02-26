class Crypto
  def initialize(plaintext)
    @text = plaintext.downcase.strip.split(/[^a-z0-9]/).join
  end

  def ciphertext
    define_sizes
    split_text
    cipher
  end

  def define_sizes
    @columns = 0
    @rows = 0
    while @text.length > @columns * @rows
      @columns += 1
      if @text.length > @columns * @rows
        @rows += 1
      end
    end
  end

  def split_text
    blockified_text = []
    while @text != ''
      if @text.length < @columns
        filler = @columns - @text.length
        blockified_text << "#{@text.slice!(0..@text.length)}#{' ' * filler}"
      else
        blockified_text << @text.slice!(0..@columns-1)
      end
    end
    @block_of_text = blockified_text.map {|x| x.chars}.transpose
  end

  def cipher
    final_message = String.new
      @block_of_text.each do |x|
        if @block_of_text.join.length - final_message.split(/[^a-z]/).join.length == @columns
          final_message << x.join
        else
          final_message << "#{x.join} "
        end
      end
    final_message
  end
end
