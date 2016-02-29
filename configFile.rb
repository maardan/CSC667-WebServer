class ConfigFile
  attr_reader :lines, :config, :mime_types

  def initialize(str)
    @lines=str
  end

  def load()
    parsedData = Hash.new()
    @lines.each_line do |line|
      if self.valid_line?(line)
        lineSplit=line.split(' ', 2) 
        parsedData[lineSplit[0]] = self.remove_quotes(lineSplit[1])
      end
    end
    return parsedData
  end

  def valid_line?(line)
    if line.tr(' ', '').start_with? '#' or 
      line.start_with? "\n" or
      line.split.length == 0
      return false
    end
    return true
  end

  def remove_quotes(str)
    return str.tr('"',"")
  end

end
