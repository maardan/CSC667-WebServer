require_relative 'configFile'

class HttpConfig < ConfigFile
  attr_reader :config

  def initialize(str)
    super(str)
    self.process_lines()
  end

  def process_lines()
    @config=Hash.new()
    line_hash=load() #retrieves hash of the multi-line string
    line_hash.each do |config_option, config_values|
      @config[config_option]=Array.new()
      config_values.split(' ').each_with_index do |config_value, iteration|
        @config[config_option][iteration]=config_value
      end
    end
  end

  def server_root()
    if(!@config.has_key?('ServerRoot'))
      return ""
    end
    return @config['ServerRoot'][0]
  end

  def document_root()
    if(!@config.has_key?('DocumentRoot'))
      return ""
    end
    return @config['DocumentRoot'][0]
  end

  def listen()
    if(!@config.has_key?('Listen'))
      return ""
    end
    return @config['Listen'][0]
  end

  def log_file()
    if(!@config.has_key?('LogFile'))
      return ""
    end
    return @config['LogFile'][0]
  end

httpd_conf=HttpConfig.new(File.open("config/httpd.conf", "r").read())
print "Server Root: ", httpd_conf.server_root(),"\n"
print "Document Root: ", httpd_conf.document_root(),"\n"
print "Listen: ", httpd_conf.listen(),"\n"
print "Log File: ",httpd_conf.log_file(),"\n"

end