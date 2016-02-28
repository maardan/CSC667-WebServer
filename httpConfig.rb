require_relative 'configFile'

class HttpConfig < ConfigFile
  attr_reader :config

	def initialize(config_file)
	    super(config_file)
	end  # def process_line
  # end 

  # def listen
    
  # end

  # def document_root
    
  # end
end 