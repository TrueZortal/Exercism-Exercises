class Atbash

  def self.encode(message)
    @message = message.downcase.chars
    encrypt
    split_encrypted_message_into_fives
  end

  def self.decode(code)
    @code = code.chars
    if @code.any? {|x| x.to_i != 0}
      secret_message = []
      @code.each do |x|
        if x.to_i != 0
          secret_message << x
        else
          secret_message << @decryption_key[x]
        end
      end
      secret_message = secret_message.join
    else
      @code.map {|x| x = @decryption_key[x]}.join
    end
  end

  private

  @alphabet = *('a'..'z')
  @decryption_key = @alphabet.reverse.zip(@alphabet).to_h
  @encryption_key = @alphabet.zip(@alphabet.reverse).to_h

  def self.encrypt
    if @message.any? {|x| x.to_i != 0}
      @encrypted_message = []
      @message.each do |x|
        if x.to_i != 0
          @encrypted_message << x
        else
          @encrypted_message << @encryption_key[x]
        end
      end
      @encrypted_message = @encrypted_message.join
    else
      @encrypted_message = @message.map {|x| x = @encryption_key[x]}.join
    end
  end

  def self.split_encrypted_message_into_fives
    if @encrypted_message.length <= 5
      @encrypted_message
    else
      longer_encrypted_message = String.new
      while @encrypted_message.length > 5
        longer_encrypted_message << "#{@encrypted_message.slice!(0..4)} "
      end
      longer_encrypted_message << @encrypted_message
      longer_encrypted_message
    end
  end
end



