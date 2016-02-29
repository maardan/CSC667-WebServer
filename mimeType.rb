require_relative 'configFile'

class MimeType < ConfigFile
  attr_reader :mime_types

  def process_lines(line_hash)
    @mime_types=Hash.new()
    line_hash.each do |mime_type, mime_extensions|
      mime_extensions.split(' ').each do |mime_extension|
        @mime_types[mime_extension]=mime_type
      end
    end
  end

  def load()
    line_hash=super
    self.process_lines(line_hash)
    return self
  end

  def for(extension)
    return @mime_types[extension]
  end

end

mimes=MimeType.new(File.open("config/mime.types", "r").read()).load
mimes.mime_types.each do |k,v|
  print k, " : ",v, "\n"
end
puts mimes.for('h261')
