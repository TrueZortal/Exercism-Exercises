class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    my_string = @line[@line.index(':')+1,@line.size]
    puts my_string.strip
  end

  def log_level
    my_string = @line[@line.index('[')+1,@line.index(']')-1]
    puts my_string.downcase
  end

  def reformat
    puts "#{message}(#{log_level})"
  end
end


LogLineParser.new('[ERROR]: Stack overflow').message
LogLineParser.new('[WARNING]: Disk almost full').message
LogLineParser.new('[INFO]: File moved').message
LogLineParser.new("[WARNING]:   \tTimezone not set  \r\n").message
LogLineParser.new('[ERROR]: Disk full').log_level
LogLineParser.new('[WARNING]: Unsafe password').log_level
LogLineParser.new('[INFO]: Timezone changed').log_level
LogLineParser.new('[ERROR]: Segmentation fault').reformat
LogLineParser.new('[WARNING]: Decreased performance').reformat
LogLineParser.new('[INFO]: Disk defragmented').reformat
LogLineParser.new("[ERROR]: \t Corrupt disk\t \t \r\n").reformat