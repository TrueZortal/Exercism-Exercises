class SecretHandshake

COMMANDS = {
1 => 'wink',
10 => 'double blink',
100 => 'close your eyes',
1000 => 'jump',
10000 => :reverse
}
  def initialize(decimal)
    @decimal = decimal.to_s(2)
    p @decimal
  end

  def commands
    [@decimal]
  end
end