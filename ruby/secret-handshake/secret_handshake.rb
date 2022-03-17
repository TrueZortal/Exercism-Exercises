class SecretHandshake

COMMANDS = {
1 => 'wink',
10 => 'double blink',
100 => 'close your eyes',
1000 => 'jump',
10000 => :reverse
}

  def initialize(decimal)
    if decimal.is_a? Integer
    @decimal = decimal.to_s(2).chars
    else
    @decimal = [nil]
    end
  end

  def commands
    commands = []
    @decimal.reverse.each_with_index do |command, index|
      action = COMMANDS[command.to_i * (10 ** index)]
      if action != nil && index != 4
        commands << COMMANDS[command.to_i * (10 ** index)]
      elsif action == :reverse
        commands = commands.reverse
      end
    end
    commands
  end
end
