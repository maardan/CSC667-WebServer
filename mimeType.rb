require_relative 'configFile'

class MimeType < ConfigFile
  attr_reader :mime_type

    def initialize(config_file)
        super(config_file)
    end

end